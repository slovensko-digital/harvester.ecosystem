class Itms::SyncAllPlannedProposalCallsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/vyzvy/planovane')
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncPlannedProposalCallJob.perform_later(href) }
  end
end
