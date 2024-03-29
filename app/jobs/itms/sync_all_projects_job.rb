class Itms::SyncAllProjectsJob < ItmsJob
  PROJECT_STATUSES = ['ukoncene', 'vrealizacii']

  def perform(downloader: ItmsJob::Downloader, modified_since: nil)
    PROJECT_STATUSES.each do |status|
      json = downloader.get_json_from_href("/v2/projekty/#{status}", modifiedSince: modified_since.presence || Itms::Project.where(ekosystem_stav: status).latest&.updated_at&.to_i)
      json.each { |item| Itms::SyncProjectJob.perform_later(item['href']) }
    end
  end
end
