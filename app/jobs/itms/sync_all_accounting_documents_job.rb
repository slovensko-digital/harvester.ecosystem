class Itms::SyncAllAccountingDocumentsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader, modified_since: latest_accounting_document_timestamp)
    json = downloader.get_json_from_href('/v2/uctovneDoklady', modifiedSince: modified_since)
    json.each { |item| Itms::SyncAccountingDocumentJob.perform_later(item['href']) }
  end
end
