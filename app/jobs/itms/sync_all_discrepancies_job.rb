class Itms::SyncAllDiscrepanciesJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/nezrovnalost')
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncDiscrepancyJob.perform_later(href) }
  end
end
