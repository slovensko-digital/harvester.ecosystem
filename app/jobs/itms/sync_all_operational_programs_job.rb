class Itms::SyncAllOperationalProgramsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader, modified_since: latest_operational_program_timestamp)
    json = downloader.get_json_from_href('/v2/operacneProgramy', modifiedSince: modified_since)
    json.each { |item| Itms::SyncOperationalProgramJob.perform_later(item['href']) }
  end
end
