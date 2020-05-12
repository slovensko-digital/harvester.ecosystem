class Itms::SyncAllProjectIndicatorsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/projektovyUkazovatel', modifiedSince: latest_project_indicator_timestamp)
    json.each { |item| Itms::SyncProjectIndicatorJob.perform_later(item['href']) }
  end
end
