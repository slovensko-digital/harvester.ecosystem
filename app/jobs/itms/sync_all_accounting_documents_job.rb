require 'harvester_utils/downloader'

class Itms::SyncAllAccountingDocumentsJob < ItmsJob
  def perform(downloader: HarvesterUtils::Downloader)
    response = downloader.get('https://opendata.itms2014.sk/v2/uctovneDoklady')
    json = JSON.parse(response.body)
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncAccountingDocumentJob.perform_later(href) }
  end
end
