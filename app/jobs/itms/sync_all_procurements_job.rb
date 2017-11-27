class Itms::SyncAllProcurementsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/verejneObstaravania')
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncProcurementJob.perform_later(href) }
  end
end
