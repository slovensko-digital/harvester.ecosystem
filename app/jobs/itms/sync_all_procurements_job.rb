class Itms::SyncAllProcurementsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader, modified_since: latest_procurement_timestamp)
    json = downloader.get_json_from_href('/v2/verejneObstaravania', modifiedSince: modified_since)
    json.each { |item| Itms::SyncProcurementJob.perform_later(item['href']) }
  end
end
