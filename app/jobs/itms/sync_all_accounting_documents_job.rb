class Itms::SyncAllAccountingDocumentsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/uctovneDoklady', modifiedSince: latest_accounting_document_timestamp)
    json.each { |item| Itms::SyncAccountingDocumentJob.perform_later(item['href']) }
  end
end
