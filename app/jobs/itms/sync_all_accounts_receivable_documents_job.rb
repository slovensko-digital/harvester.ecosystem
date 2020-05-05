class Itms::SyncAllAccountsReceivableDocumentsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/pohladavkovyDoklad', modifiedSince: latest_accounts_receivable_document_timestamp)
    json.each { |item| Itms::SyncAccountsReceivableDocumentJob.perform_later(item['href']) }
  end
end
