class Itms::SyncAllPaymentClaimsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/zop/predlozene')
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncPaymentClaimJob.perform_later(href) }
  end
end
