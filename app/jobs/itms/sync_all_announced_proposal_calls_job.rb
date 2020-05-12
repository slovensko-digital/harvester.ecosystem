class Itms::SyncAllAnnouncedProposalCallsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/vyzvy/vyhlasene', modifiedSince: latest_announced_proposal_call_timestamp)
    json.each { |item| Itms::SyncAnnouncedProposalCallJob.perform_later(item['href']) }
  end
end
