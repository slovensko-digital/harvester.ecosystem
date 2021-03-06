class Upvs::FetchPublicAuthorityEdesksListJob < ApplicationJob
  queue_as :upvs

  def perform(url, downloader: HarvesterUtils::Downloader)
    csv_file = downloader.download_file(url)
    csv_options = { col_sep: File.open(csv_file) { |f| f.readline }.include?(';') ? ';' : ',', headers: true }

    TemporaryPublicAuthorityEdesk.transaction do
      TemporaryPublicAuthorityEdesk.create_table!

      each_row_as_attributes(csv_file, csv_options) do |attributes|
        check_row_attributes(attributes)
        TemporaryPublicAuthorityEdesk.find_or_initialize_by(uri: attributes[:uri]).update!(attributes)
      end

      assert_known_edesks_existence!

      TemporaryPublicAuthorityEdesk.truncate_source_table!
      TemporaryPublicAuthorityEdesk.insert_to_source_table!
    end
  end

  class TemporaryPublicAuthorityEdesk < TemporaryRecord
    def self.source
      Upvs::PublicAuthorityEdesk
    end
  end

  private

  def each_row_as_attributes(csv_file, csv_options)
    CSV.foreach(csv_file, csv_options) do |row|
      row = row.to_h.transform_keys { |k| k.to_s.gsub(/\p{Cf}/, '') }

      yield(
        cin: row.fetch('ICO'),
        uri: row.fetch('URI'),
        name: row.fetch('Nazov')
      )
    end
  end

  def check_row_attributes(attributes)
    cin, uri, name = attributes.slice(:cin, :uri, :name).values

    if name !~ /TEST/i
      raise "#{uri} does not match #{cin}" if uri !~ /ico:\/\/sk\/(0*)#{cin}(_\d+)?/
    end
  end

  def assert_known_edesks_existence!
    repository = TemporaryPublicAuthorityEdesk
    repository.find_by!(uri: 'ico://sk/00151513', cin: '151513', name: 'Úrad vlády Slovenskej republiky')
    repository.find_by!(uri: 'ico://sk/00151513_10003', cin: '151513', name: 'Úrad vlády Slovenskej republiky - Petície')
  end
end
