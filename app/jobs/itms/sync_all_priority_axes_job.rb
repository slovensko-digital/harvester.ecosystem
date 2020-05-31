class Itms::SyncAllPriorityAxesJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    operational_programs_json = downloader.get_json_from_href('/v2/operacneProgramy')

    operational_programs_json.each do |item|
      priority_axes_json = downloader.get_json_from_href("/v2/operacneProgramy/#{item['id']}/prioritneOsi")
      priority_axes_json.each { |json| Itms::SyncPriorityAxisJob.perform_later(json['href']) }
    end
  end
end
