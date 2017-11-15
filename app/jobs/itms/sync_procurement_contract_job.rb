require 'harvester_utils/downloader'

class Itms::SyncProcurementContractJob < ItmsJob
  def perform(itms_href, procurement, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk#{itms_href}")
    json = JSON.parse(response.body)
    itms_id = itms_href.split('/').last

    ActiveRecord::Base.transaction do
      pc = Itms::ProcurementContract.find_or_initialize_by(itms_id: itms_id)
      pc.itms_href = json['href']
      pc.itms_created_at = json['createdAt']
      pc.itms_updated_at = json['updatedAt']
      pc.save!

      pc.celkova_suma_zmluvy = json['celkovaSumaZmluvy']
      pc.cislo_zmluvy = json['cisloZmluvy']
      pc.dalsie_url = find_or_create_procurement_contract_urls_by_json(json['dalsieUrl'], pc.dalsie_url)
      pc.datum_platnosti = json['datumPlatnosti']
      pc.datum_ucinnosti = json['datumUcinnosti']
      pc.dodavatelia = find_or_create_procurement_contract_suppliers_by_json(json['dodavatelia'], pc.dodavatelia, downloader)
      pc.hlavny_dodavatel_dodavatel_obstaravatel = find_or_create_supplier_by_json(json['hlavnyDodavatelDodavatelObstaravatel'], downloader)
      pc.hlavny_dodavatel_subjekt = find_or_create_subject_by_json(json['hlavnyDodavatelSubjekt'], downloader)
      pc.kod = json['kod']
      pc.nazov = json['nazov']
      pc.predmet_zmluvy = json['predmetZmluvy']
      pc.suma_bez_dph = json['sumaBezDph']
      pc.url_odkaz_na_zmluvu = json['urlOdkazNaZmluvu']
      pc.verejne_obstaravanie = procurement
      
      pc.save!
    end
  end

  private

  def find_or_create_procurement_contract_urls_by_json(json, scope)
    return [] if json.blank?
    json.map do |j|
      scope.find_or_create_by!(nazov: j['nazov'], url: j['url'])
    end
  end

  def find_or_create_procurement_contract_suppliers_by_json(json, scope, downloader)
    return [] if json.blank?
    json.map do |j|
      scope.find_or_create_by!(
        dodavatel_subjekt: find_or_create_subject_by_json(j['dodavatelSubjekt'], downloader),
        dodavatel_dodavatel_obstaravatel: find_or_create_supplier_by_json(j['dodavatelDodavatelObstaravatel'], downloader),
        je_hlavny_dodavatel: j['jeHlavnyDodavatel']
      )
    end
  end
end