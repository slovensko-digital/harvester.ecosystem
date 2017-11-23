class Itms::SyncAllAnnouncedProposalCallsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/vyzvy/vyhlasene')
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncAnnouncedProposalCallJob.perform_later(href) }
  end
end
