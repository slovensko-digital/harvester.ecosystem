require 'harvester_utils/downloader'

class Itms::SyncAllNrfcApplicationsJob < ItmsJob
  def perform(downloader: HarvesterUtils::Downloader)
    response = downloader.get('https://opendata.itms2014.sk/v2/zonfp/prijate')
    hrefs = JSON.parse(response.body).map { |item| item['href'] }

    hrefs.each { |href| Itms::SyncNrfcApplicationJob.perform_later(href) }
  end
end
