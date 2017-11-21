require 'harvester_utils/downloader'

class Itms::SyncAllAccountsReceivableDocumentsJob < ItmsJob
  def perform(downloader: HarvesterUtils::Downloader)
    response = downloader.get('https://opendata.itms2014.sk/v2/pohladavkovyDoklad')
    json = JSON.parse(response.body)
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncAccountsReceivableDocumentJob.perform_later(href) }
  end
end
