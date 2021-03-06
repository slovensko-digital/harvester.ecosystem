class Itms::SyncSpecificGoalJob < ItmsJob
  def perform(itms_href, downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href(itms_href)

    ActiveRecord::Base.transaction do
      sg = Itms::SpecificGoal.find_or_create_by!(itms_id: json['id'])
      sg.itms_href = json['href']
      sg.itms_created_at = json['createdAt']
      sg.itms_updated_at = json['updatedAt']

      sg.fond = find_or_create_codelist_value_by_json(json['fond'], downloader)
      sg.kategoria_regionov = find_or_create_codelist_value_by_json(json['kategoriaRegionov'], downloader)
      sg.kod = json['kod']
      sg.nazov = json['nazov']
      sg.prioritna_os = find_or_create_priority_axis_by_json(json['prioritnaOs'], downloader)
      sg.technicka_asistencia = json['technickaAsistencia']
      sg.typy_aktivit = find_or_create_activity_types_by_json(json['typyAktivit'], downloader)

      sg.save!
    end
  end
end
