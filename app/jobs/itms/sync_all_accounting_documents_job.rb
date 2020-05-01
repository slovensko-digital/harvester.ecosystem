class Itms::SyncAllAccountingDocumentsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/uctovneDoklady', modifiedSince: latest_timestamp)
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncAccountingDocumentJob.perform_later(href) }
  end
end
