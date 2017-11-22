require 'harvester_utils/downloader'

class Itms::SyncAllActivityTypesJob < ItmsJob
  def perform(downloader: HarvesterUtils::Downloader)
    response = downloader.get('https://opendata.itms2014.sk/v2/typyAktivit')
    json = JSON.parse(response.body)
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncActivityTypeJob.perform_later(href) }
  end
end
