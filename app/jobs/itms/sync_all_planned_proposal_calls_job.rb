class Itms::SyncAllPlannedProposalCallsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json_list = downloader.get_json_from_href('/v2/vyzvy/planovane')
    json_list.map do |json|
      Itms::SyncPlannedProposalCallJob.perform_later(json['href'])
    end
  end
end
