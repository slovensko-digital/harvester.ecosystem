class Itms::SyncAllProcurementsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/verejneObstaravania', modifiedSince: latest_procurement_timestamp)
    json.each { |item| Itms::SyncProcurementJob.perform_later(item['href']) }
  end
end
