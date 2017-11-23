class Itms::SyncActivityJob < ItmsJob
  def perform(itms_href, downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href(itms_href)

    ActiveRecord::Base.transaction do
      pa = Itms::Activity.find_or_create_by!(itms_id: json['id'])
      pa.itms_href = json['href']

      pa.datum_konca_planovany = json['datumKoncaPlanovany']
      pa.datum_konca_skutocny = json['datumKoncaSkutocny']
      pa.datum_zaciatku_planovany = json['datumZaciatkuPlanovany']
      pa.datum_zaciatku_skutocny = json['datumZaciatkuSkutocny']
      pa.kod = json['kod']
      pa.nazov = json['nazov']
      pa.subjekt = find_or_create_subject_by_json(json['subjekt'], downloader)
      pa.typ_aktivity = find_or_create_activity_type_by_json(json['typAktivity'], downloader)

      pa.save!
    end
  end
end
