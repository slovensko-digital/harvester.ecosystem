class Itms::SyncAllProjectsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/projekty/ukoncene')
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncProjectJob.perform_later(href) }

    json = downloader.get_json_from_href('/v2/projekty/vrealizacii')
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncProjectJob.perform_later(href) }
  end
end
