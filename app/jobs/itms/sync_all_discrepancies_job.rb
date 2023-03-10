class Itms::SyncAllDiscrepanciesJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader, modified_since: latest_discrepancy_timestamp)
    json = downloader.get_json_from_href('/v2/nezrovnalost', modifiedSince: modified_since)
    json.each { |item| Itms::SyncDiscrepancyJob.perform_later(item['href']) }
  end
end
