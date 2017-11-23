class Itms::SyncAllPriorityAxesJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    operational_programs_json = downloader.get_json_from_href('/v2/operacneProgramy')
    operational_programs_ids = operational_programs_json.map { |json| json['id'] }

    operational_programs_ids.map do |op_id|
      priority_axes_json = downloader.get_json_from_href("/v2/operacneProgramy/#{op_id}/prioritneOsi")
      priority_axes_json.map { |json| Itms::SyncPriorityAxisJob.perform_later(json['href']) }
    end
  end
end
