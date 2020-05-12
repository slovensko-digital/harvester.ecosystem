class Itms::SyncAllActivitiesJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/aktivita', modifiedSince: latest_activity_timestamp)
    json.each { |item| Itms::SyncActivityJob.perform_later(item['href']) }
  end
end
