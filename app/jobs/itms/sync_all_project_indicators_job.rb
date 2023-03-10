class Itms::SyncAllProjectIndicatorsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader, modified_since: latest_project_indicator_timestamp)
    json = downloader.get_json_from_href('/v2/projektovyUkazovatel', modifiedSince: modified_since)
    json.each { |item| Itms::SyncProjectIndicatorJob.perform_later(item['href']) }
  end
end
