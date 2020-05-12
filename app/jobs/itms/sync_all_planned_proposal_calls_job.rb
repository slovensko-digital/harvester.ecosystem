class Itms::SyncAllPlannedProposalCallsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/vyzvy/planovane', modifiedSince: Itms::PlannedProposalCall.latest&.updated_at&.to_i)
    json.each { |item| Itms::SyncPlannedProposalCallJob.perform_later(item['href']) }
  end
end
