class Itms::SyncAllActivitiesJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader, modified_since: latest_activity_timestamp)
    json = downloader.get_json_from_href('/v2/aktivita', modifiedSince: modified_since)
    json.each { |item| Itms::SyncActivityJob.perform_later(item['href']) }
  end
end
