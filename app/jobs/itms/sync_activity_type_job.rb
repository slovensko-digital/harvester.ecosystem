class Itms::SyncActivityTypeJob < ItmsJob
  def perform(itms_href, downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href(itms_href)

    ActiveRecord::Base.transaction do
      at = Itms::ActivityType.find_or_create_by!(itms_id: json['id'])
      at.itms_href = json['href']
      at.itms_created_at = json['createdAt']
      at.itms_updated_at = json['updatedAt']

      at.kod = json['kod']
      at.nazov = json['nazov']
      at.save!
    end
  end
end
