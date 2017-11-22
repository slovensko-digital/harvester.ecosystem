require 'harvester_utils/downloader'

class Itms::SyncAllPriorityAxesJob < ItmsJob
  def perform(downloader: HarvesterUtils::Downloader)
    response = downloader.get('https://opendata.itms2014.sk/v2/operacneProgramy')
    operational_programs_ids = JSON.parse(response.body).map { |json| json['id'] }

    priority_axes_hrefs = []
    operational_programs_ids.map do |op_id|
      response = downloader.get("https://opendata.itms2014.sk/v2/operacneProgramy/#{op_id}/prioritneOsi")
      priority_axes_hrefs.concat(JSON.parse(response.body).map { |json| json['href'] })
    end

    priority_axes_hrefs.map do |priority_axis_href|
      Itms::SyncPriorityAxisJob.perform_later(priority_axis_href)
    end
  end
end
