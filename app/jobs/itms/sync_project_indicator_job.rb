require 'harvester_utils/downloader'

class Itms::SyncProjectIndicatorJob < ItmsJob
  def perform(itms_id, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk/v2/projektovyUkazovatel/#{itms_id}")
    json = JSON.parse(response.body)

    pi = Itms::ProjectIndicator.find_or_initialize_by(itms_id: itms_id)

    pi.itms_href = json['href']
    pi.itms_created_at = json['createdAt']
    pi.itms_updated_at = json['updatedAt']

    pi.cas_plnenia = find_or_create_codelist_values_by_json(json['casPlnenia'], downloader)
    pi.definicia = json['definicia']
    pi.evidencia_podla_pohlavia = json['evidenciaPodlaPohlavia']
    pi.fondy = find_or_create_codelist_values_by_json(json['fondy'], downloader)
    pi.kod = json['kod']
    pi.merna_jednotka = json['mernaJednotka']
    pi.nazov = json['nazov']
    pi.platnost = json['platnost']
    pi.typ_vypoctu = json['typVypoctu']

    pi.save!
  end
end