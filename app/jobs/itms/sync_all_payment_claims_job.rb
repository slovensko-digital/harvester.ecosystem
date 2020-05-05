class Itms::SyncAllPaymentClaimsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/zop/predlozene', modifiedSince: latest_payment_claim_timestamp)
    json.each { |item| Itms::SyncPaymentClaimJob.perform_later(item['href']) }
  end
end
