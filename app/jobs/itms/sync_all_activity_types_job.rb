class Itms::SyncAllActivityTypesJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/typyAktivit', modifiedSince: latest_activity_type_timestamp)
    json.each { |item| Itms::SyncActivityTypeJob.perform_later(item['href']) }
  end
end
