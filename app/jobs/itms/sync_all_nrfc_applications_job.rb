class Itms::SyncAllNrfcApplicationsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/zonfp/prijate')
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncNrfcApplicationJob.perform_later(href) }
  end
end
