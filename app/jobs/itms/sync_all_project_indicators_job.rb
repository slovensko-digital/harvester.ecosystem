class Itms::SyncAllProjectIndicatorsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/projektovyUkazovatel')
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncProjectIndicatorJob.perform_later(href) }
  end
end
