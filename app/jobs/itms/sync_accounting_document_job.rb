require 'harvester_utils/downloader'

class Itms::SyncAccountingDocumentJob < ItmsJob
  def perform(itms_href, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk#{itms_href}")
    json = JSON.parse(response.body)
    itms_id = itms_href.split('/').last

    ActiveRecord::Base.transaction do
      ad = Itms::AccountingDocument.find_or_create_by!(itms_id: itms_id)
      ad.itms_href = json['href']
      ad.itms_created_at = json['createdAt']
      ad.itms_updated_at = json['updatedAt']

      ad.datum_uhrady = json['datumUhrady']
      ad.datum_vyhotovenia = json['datumVyhotovenia']
      ad.dodavatel_dodavatel_obstaravatel = find_or_create_supplier_by_json(json['dodavatelDodavatelObstaravatel'], downloader)
      ad.dodavatel_subjekt = find_or_create_subject_by_json(json['dodavatelSubjekt'], downloader)
      ad.nazov = json['nazov']
      ad.polozky_dokladu = find_or_create_accounting_document_items_by_json(json['polozkyDokladu'], ad.polozky_dokladu)
      ad.typ = json['typ']
      ad.vlastnik_dokladu = find_or_create_subject_by_json(json['vlastnikDokladu'], downloader)

      ad.save!
    end
  end

  private

  def find_or_create_accounting_document_items_by_json(json_list, scope)
    return [] if json_list.blank?

    json_list.map do |json|
      adi = scope.find_or_initialize_by(itms_id: json['id'])
      adi.dph = json['dph']
      adi.jednotkova_cena = json['jednotkovaCena']
      adi.mnozstvo = json['mnozstvo']
      adi.nazov = json['nazov']
      adi.poradove_cislo = json['poradoveCislo']
      adi.sadzba_dph = json['sadzbaDph']
      adi.suma_bez_dph = json['sumaBezDph']
      adi.suma_opravnena = json['sumaOpravnena']
      adi.suma_spolu = json['sumaSpolu']
      adi.suma_ziadana = json['sumaZiadana']
      adi.suma_zrealizovanych_vydavkov = json['sumaZrealizovanychVydavkov']
      adi.save!

      adi
    end
  end
end
