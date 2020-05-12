class Itms::SyncAllSpecificGoalsJob < ItmsJob
  def perform(downloader: ItmsJob::Downloader)
    operational_programs_json = downloader.get_json_from_href('/v2/operacneProgramy')
    operational_programs_ids = operational_programs_json.map { |json| json['id'] }

    priority_axes_ids = operational_programs_ids.flat_map do |op_id|
      priority_axes_json = downloader.get_json_from_href("/v2/operacneProgramy/#{op_id}/prioritneOsi")
      priority_axes_json.map { |json| json['id'] }
    end

    priority_axes_ids.each do |pa_id|
      specific_goals_json = downloader.get_json_from_href("/v2/prioritnaOs/#{pa_id}/konkretneCiele", modifiedSince: latest_specific_goal_timestamp)
      specific_goals_json.each { |json| Itms::SyncSpecificGoalJob.perform_later(json['href']) }
    end
  end
end
