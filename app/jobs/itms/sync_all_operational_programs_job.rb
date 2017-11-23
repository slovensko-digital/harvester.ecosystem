class Itms::SyncAllOperationalProgramsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json_list = downloader.get_json_from_href('/v2/operacneProgramy')
    json_list.map do |json|
      Itms::SyncOperationalProgramJob.perform_later(json['href'])
    end
  end
end
