require 'harvester_utils/downloader'

class Itms::SyncAllProcurementsJob < ItmsJob
  def perform(downloader: HarvesterUtils::Downloader)
    response = downloader.get('https://opendata.itms2014.sk/v2/verejneObstaravania')
    json = JSON.parse(response.body)
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncProcurementJob.perform_later(href) }
  end
end
