require 'harvester_utils/downloader'

class Itms::SyncActivityTypeJob < ItmsJob
  def perform(itms_id, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk/v2/typyAktivit/#{itms_id}")
    json = JSON.parse(response.body)

    ActiveRecord::Base.transaction do
      u = Itms::ActivityType.find_or_initialize_by(itms_id: itms_id)
      u.itms_href = json['href']
      u.itms_created_at = json['createdAt']
      u.itms_updated_at = json['updatedAt']

      u.kod = json['kod']
      u.nazov = json['nazov']
      u.save!
    end
  end
end