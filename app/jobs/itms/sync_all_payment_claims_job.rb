class Itms::SyncAllPaymentClaimsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/zop/predlozene', modifiedSince: latest_payment_claim_timestamp)
    json.each { |item| Itms::SyncPaymentClaimJob.perform_later(item['href']) }
  end

  def latest_payment_claim_timestamp
    [Itms::PaymentClaim.where.not(itms_updated_at: nil).order(:itms_updated_at).last.itms_updated_at, Itms::PaymentClaim.where.not(itms_created_at: nil).order(:itms_created_at).last.itms_created_at].max.to_i
  end
end
