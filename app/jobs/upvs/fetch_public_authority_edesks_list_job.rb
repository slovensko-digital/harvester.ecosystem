require 'csv'
require 'harvester_utils/downloader'

class Upvs::FetchPublicAuthorityEdesksListJob < ApplicationJob
  queue_as :upvs

  def perform(url, downloader: HarvesterUtils::Downloader)
    csv_file = downloader.download_file(url)
    csv_options = { col_sep: File.open(csv_file) { |f| f.readline }.include?(';') ? ';' : ',', headers: true }

    TemporaryPublicAuthorityEdesk.transaction do
      TemporaryPublicAuthorityEdesk.create_table!

      each_row_as_attributes(csv_file, csv_options) do |attributes|
        TemporaryPublicAuthorityEdesk.create!(attributes)
      end

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

      uri = row.fetch('URI')
      cin = row['IČO'] || row['IČO'] || row.fetch('ICO')

      raise "#{uri} does not match #{cin}" if uri !~ /ico:\/\/sk\/(0*)#{cin}(_\d+)?/

      yield(
        uri: uri,
        cin: cin,
        name: row['NAZOV INŠTITÚCIE'] || row.fetch('NÁZOV'),
        street: row.fetch('ULICA'),
        street_number: row.fetch('ČÍSLO'),
        postal_code: row.fetch('PSČ'),
        city: row.fetch('MESTO')
      )
    end
  end
end
