class Itms::SyncAllProjectIndicatorsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json_list = downloader.get_json_from_href('/v2/projektovyUkazovatel')
    json_list.map do |json|
      Itms::SyncProjectIndicatorJob.perform_later(json['href'])
    end
  end
end
