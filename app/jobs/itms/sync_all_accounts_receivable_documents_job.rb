class Itms::SyncAllAccountsReceivableDocumentsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/pohladavkovyDoklad')
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncAccountsReceivableDocumentJob.perform_later(href) }
  end
end
