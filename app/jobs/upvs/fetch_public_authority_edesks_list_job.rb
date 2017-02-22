require 'csv'
require 'harvester_utils/downloader'

class Upvs::FetchPublicAuthorityEdesksListJob < ApplicationJob
  # TODO timeouts
  queue_as :upvs

  def perform(downloader: HarvesterUtils::Downloader)
    file = downloader.download_file('https://data.gov.sk/dataset/7d918796-3c9a-44a5-95a9-7e1dfca76407/resource/456a5bc6-32bd-4346-bcd1-12ee171ac010/download/zoznamintituciisozriadenoues.csv')
    CSV.foreach(file, headers: true) do |row|
      uri = row.fetch('URI')
      edesk = Upvs::PublicAuthorityEdesk.find_or_initialize_by(uri: uri)
      edesk.cin = row.fetch('IČO')
      edesk.name = row.fetch('NAZOV INŠTITÚCIE')
      edesk.street = row.fetch('ULICA')
      edesk.street_number = row.fetch('ČÍSLO')
      edesk.postal_code = row.fetch('PSČ')
      edesk.city = row.fetch('MESTO')
      edesk.save!
    end
  end
end
