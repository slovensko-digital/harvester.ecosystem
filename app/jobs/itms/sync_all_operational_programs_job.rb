class Itms::SyncAllOperationalProgramsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/operacneProgramy', modifiedSince: latest_operational_program_timestamp)
    json.each { |item| Itms::SyncOperationalProgramJob.perform_later(item['href']) }
  end
end
