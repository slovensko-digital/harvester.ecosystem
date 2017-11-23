class Itms::SyncAllPaymentClaimsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json_list = downloader.get_json_from_href('/v2/zop/predlozene')
    json_list.map do |json|
      Itms::SyncPaymentClaimJob.perform_later(json['href'])
    end
  end
end
