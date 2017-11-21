require 'harvester_utils/downloader'

class Itms::SyncAllProjectIndicatorsJob < ItmsJob
  def perform(downloader: HarvesterUtils::Downloader)
    response = downloader.get('https://opendata.itms2014.sk/v2/projektovyUkazovatel')
    json = JSON.parse(response.body)
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncProjectIndicatorJob.perform_later(href) }
  end
end
