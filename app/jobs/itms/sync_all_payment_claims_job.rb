class Itms::SyncAllPaymentClaimsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/zop/predlozene', modifiedSince: Itms::PaymentClaim.order(:itms_updated_at).last&.updated_at&.to_i)
    json.each { |item| Itms::SyncPaymentClaimJob.perform_later(item['href']) }
  end
end
