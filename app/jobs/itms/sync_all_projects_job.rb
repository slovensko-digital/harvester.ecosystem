class Itms::SyncAllProjectsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json_list = downloader.get_json_from_href('/v2/projekty/ukoncene')
    json_list.map do |json|
      Itms::SyncProjectJob.perform_later(json['href'])
    end

    json_list = downloader.get_json_from_href('/v2/projekty/vrealizacii')
    json_list.map do |json|
      Itms::SyncProjectJob.perform_later(json['href'])
    end
  end
end
