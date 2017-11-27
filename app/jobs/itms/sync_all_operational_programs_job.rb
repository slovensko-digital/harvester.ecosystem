class Itms::SyncAllOperationalProgramsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href('/v2/operacneProgramy')
    hrefs = json.map { |item| item['href'] }
    hrefs.each { |href| Itms::SyncOperationalProgramJob.perform_later(href) }
  end
end
