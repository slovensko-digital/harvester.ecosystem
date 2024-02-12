class Upvs::FetchPublicAuthorityActiveEdesksListJob < ApplicationJob
  queue_as :upvs

  DATASET_URL = 'https://data.slovensko.sk/download?id=fa54d032-c8ec-4c92-8fbe-2b2730a9d202'

  def perform(downloader: HarvesterUtils::Downloader)
    csv_file = downloader.download_file(DATASET_URL)
    csv_options = { col_sep: File.open(csv_file) { |f| f.readline }.include?(';') ? ';' : ',', headers: true }

    TemporaryPublicAuthorityActiveEdesk.transaction do
      TemporaryPublicAuthorityActiveEdesk.create_table!

      each_row_as_attributes(csv_file, csv_options) do |attributes|
        check_row_attributes(attributes)
        TemporaryPublicAuthorityActiveEdesk.find_or_initialize_by(uri: attributes[:uri]).update!(attributes)
      end

      assert_known_edesks_existence!

      TemporaryPublicAuthorityActiveEdesk.truncate_source_table!
      TemporaryPublicAuthorityActiveEdesk.insert_to_source_table!
    end

    BetterUptimeApi.ping_heartbeat('UPVS_FETCH_EDESKS')
  end

  class TemporaryPublicAuthorityActiveEdesk < TemporaryRecord
    def self.source
      Upvs::PublicAuthorityActiveEdesk
    end
  end

  private

  def each_row_as_attributes(csv_file, csv_options)
    CSV.foreach(csv_file, csv_options) do |row|
      row = row.to_h.transform_keys { |k| k.to_s.gsub(/\p{Cf}|"/, '') }

      row[row.keys.first].sub!(/\A"/, '')
      row[row.keys.last].sub!(/"\z/, '')

      row = row.to_h.transform_keys { |k| k.to_s }
      row = row.transform_values { |v| v == 'NULL' ? nil : v }

      yield(
        cin: row.fetch('ICO'),
        uri: row.fetch('URI'),
        name: row.fetch('NAZOV')
      )
    end
  end

  def check_row_attributes(attributes)
    cin, uri, name = attributes.slice(:cin, :uri, :name).values

    cin_without_leading_zeros = cin.sub(/^[0]+/,'')

    if name !~ /TEST/i
      raise "#{uri} does not match #{cin}" if uri !~ /ico:\/\/sk\/(0*)#{cin_without_leading_zeros}(_\d+)?/
    end

    raise "Incorrect encoding" if name =~ /.*\\u.*/
  end

  def assert_known_edesks_existence!
    repository = TemporaryPublicAuthorityActiveEdesk
    repository.find_by!(uri: 'ico://sk/00151513', cin: '151513', name: 'Úrad vlády Slovenskej republiky')
    repository.find_by!(uri: 'ico://sk/00151513_10003', cin: '151513', name: 'Úrad vlády Slovenskej republiky - Petície')
    repository.find_by!(uri: 'ico://sk/00164381', cin: '164381', name: 'Ministerstvo školstva, vedy, výskumu a športu Slovenskej republiky')
  end
end
