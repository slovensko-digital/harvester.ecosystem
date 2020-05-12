class Itms::SyncAllDiscrepanciesJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/nezrovnalost', modifiedSince: latest_discrepancy_timestamp)
    json.each { |item| Itms::SyncDiscrepancyJob.perform_later(item['href']) }
  end
end
