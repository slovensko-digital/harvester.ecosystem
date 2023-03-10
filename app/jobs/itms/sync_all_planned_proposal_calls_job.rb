class Itms::SyncAllPlannedProposalCallsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader, modified_since: Itms::PlannedProposalCall.latest&.updated_at&.to_i)
    json = downloader.get_json_from_href('/v2/vyzvy/planovane', modifiedSince: modified_since)
    json.each { |item| Itms::SyncPlannedProposalCallJob.perform_later(item['href']) }
  end
end
