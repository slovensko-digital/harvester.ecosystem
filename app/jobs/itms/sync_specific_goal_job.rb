require 'harvester_utils/downloader'

class Itms::SyncSpecificGoalJob < ItmsJob
  def perform(itms_id, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk/v2/konkretnyCiel/#{itms_id}")
    json = JSON.parse(response.body)

    sg = Itms::SpecificGoal.find_or_initialize_by(itms_id: itms_id)

    sg.itms_href = json['href']
    sg.itms_created_at = json['createdAt']
    sg.itms_updated_at = json['updatedAt']

    sg.fond = find_or_create_codelist_value_by_json(json['fond'], downloader)
    sg.kategoria_regionov = json ['kategoriaRegionov']
    sg.kod = json ['kod']
    sg.nazov = json ['nazov']
    sg.technicka_asistencia = json ['technickaAsistencia']

    sg.save!
  end
end