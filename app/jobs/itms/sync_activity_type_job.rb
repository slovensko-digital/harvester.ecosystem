class Itms::SyncActivityTypeJob < ItmsJob
  def perform(itms_href, downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href(itms_href)

    ActiveRecord::Base.transaction do
      u = Itms::ActivityType.find_or_create_by!(itms_id: json['id'])
      u.itms_href = json['href']
      u.itms_created_at = json['createdAt']
      u.itms_updated_at = json['updatedAt']

      u.kod = json['kod']
      u.nazov = json['nazov']
      u.save!
    end
  end
end
