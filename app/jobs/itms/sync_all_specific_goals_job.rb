require 'harvester_utils/downloader'

class Itms::SyncAllSpecificGoalsJob < ItmsJob
  def perform(downloader: HarvesterUtils::Downloader)
    response = downloader.get('https://opendata.itms2014.sk/v2/operacneProgramy')
    operational_programs_ids = JSON.parse(response.body).map { |json| json['id'] }

    priority_axes_ids = []
    operational_programs_ids.map do |op_id|
      response = downloader.get("https://opendata.itms2014.sk/v2/operacneProgramy/#{op_id}/prioritneOsi")
      priority_axes_ids.concat(JSON.parse(response.body).map { |json| json['id'] })
    end

    specific_goals_hrefs = []
    priority_axes_ids.map do |pa_id|
      response = downloader.get("https://opendata.itms2014.sk/v2/prioritnaOs/#{pa_id}/konkretneCiele")
      specific_goals_hrefs.concat(JSON.parse(response.body).map { |json| json['href'] })
    end

    specific_goals_hrefs.map do |specific_goals_href|
      Itms::SyncSpecificGoalJob.perform_later(specific_goals_href)
    end
  end
end
