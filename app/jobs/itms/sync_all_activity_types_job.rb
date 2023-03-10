class Itms::SyncAllActivityTypesJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader, modified_since: latest_activity_type_timestamp)
    json = downloader.get_json_from_href('/v2/typyAktivit', modifiedSince: modified_since)
    json.each { |item| Itms::SyncActivityTypeJob.perform_later(item['href']) }
  end
end
