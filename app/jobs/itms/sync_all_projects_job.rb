require 'harvester_utils/downloader'

class Itms::SyncAllProjectsJob < ItmsJob
  def perform(downloader: HarvesterUtils::Downloader)
    response = downloader.get('https://opendata.itms2014.sk/v2/projekty/ukoncene')
    json = JSON.parse(response.body)
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncProjectJob.perform_later(href) }

    response = downloader.get('https://opendata.itms2014.sk/v2/projekty/vrealizacii')
    json = JSON.parse(response.body)
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncProjectJob.perform_later(href) }
  end
end
