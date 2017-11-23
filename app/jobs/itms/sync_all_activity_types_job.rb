class Itms::SyncAllActivityTypesJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/typyAktivit')
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncActivityTypeJob.perform_later(href) }
  end
end
