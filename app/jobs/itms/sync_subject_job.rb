require 'harvester_utils/downloader'

class Itms::SyncSubjectJob < ApplicationJob
  def perform(itms_id, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk/v2/subjekty/#{itms_id}")
    json = JSON.parse(response.body)

    u = Itms::Subject.find_or_initialize_by(itms_id: itms_id)

    u.itms_href = json['href']
    u.itms_created_at = json['createdAt']
    u.itms_updated_at = json['updatedAt']

    u.dic = json['dic']
    u.gps_lat = json['gpsLat']
    u.gps_lon = json['gpsLon']
    u.ico = json['ico']
    u.ine_identifikacne_cislo = json['ineIdentifikacneCislo']
    u.nazov = json['nazov']
    u.obec = json['obec']
    u.psc = json['psc']
    u.stat = json['stat']
    u.typ_ineho_identifikacneho_cisla = json['typInehoIdentifikacnehoCisla']
    u.ulica = json['ulica']
    u.ulica_cislo = json['ulicaCislo']

    u.save!
  end
end