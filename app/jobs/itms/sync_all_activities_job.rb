class Itms::SyncAllActivitiesJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/aktivita')
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncActivityJob.perform_later(href) }
  end
end
