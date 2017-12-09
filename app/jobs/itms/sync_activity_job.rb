class Itms::SyncActivityJob < ItmsJob
  def perform(itms_href, downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href(itms_href)

    ActiveRecord::Base.transaction do
      a = Itms::Activity.find_or_create_by!(itms_id: json['id'])
      a.itms_href = json['href']

      a.datum_konca_planovany = json['datumKoncaPlanovany']
      a.datum_konca_skutocny = json['datumKoncaSkutocny']
      a.datum_zaciatku_planovany = json['datumZaciatkuPlanovany']
      a.datum_zaciatku_skutocny = json['datumZaciatkuSkutocny']
      a.kod = json['kod']
      a.nazov = json['nazov']
      a.subjekt = find_or_create_subject_by_json(json['subjekt'], downloader)
      a.typ_aktivity = find_or_create_activity_type_by_json(json['typAktivity'], downloader)

      a.save!
    end
  rescue ItmsJob::Downloader::NotFoundError
    itms_id = itms_href.split('/').last
    a = Itms::Activity.find_by(itms_id: itms_id)
    a.destroy! if a
  end
end
