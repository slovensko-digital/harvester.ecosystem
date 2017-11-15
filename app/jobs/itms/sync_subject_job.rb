require 'harvester_utils/downloader'

class Itms::SyncSubjectJob < ItmsJob
  def perform(itms_href, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk#{itms_href}")
    json = JSON.parse(response.body)
    itms_id = itms_href.split('/').last

    ActiveRecord::Base.transaction do
      s = Itms::Subject.find_or_initialize_by(itms_id: itms_id)
      s.itms_href = json['href']
      s.itms_created_at = json['createdAt']
      s.itms_updated_at = json['updatedAt']
      s.save!

      s.dic = json['dic']
      s.ico = json['ico']
      s.ine_identifikacne_cislo = json['ineIdentifikacneCislo']
      s.nazov = json['nazov']
      s.obec = find_or_create_nuts_code_by_json(json['obec'], downloader)
      s.psc = json['psc']
      s.stat = find_or_create_codelist_value_by_json(json['stat'], downloader)
      s.typ_ineho_identifikacneho_cisla = find_or_create_codelist_value_by_json(json['typInehoIdentifikacnehoCisla'], downloader)
      s.ulica = json['ulica']
      s.ulica_cislo = json['ulicaCislo']
      s.save!
    end
  end
end