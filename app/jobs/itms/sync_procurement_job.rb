require 'harvester_utils/downloader'

class Itms::SyncProcurementJob < ItmsJob
  def perform(itms_href, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk#{itms_href}")
    json = JSON.parse(response.body)
    itms_id = itms_href.split('/').last

    ActiveRecord::Base.transaction do
      p = Itms::Procurement.find_or_initialize_by(itms_id: itms_id)
      p.itms_href = json['href']
      p.itms_created_at = json['createdAt']
      p.itms_updated_at = json['updatedAt']

      p.centralne_obstaravanie = json['centralneObstaravanie']
      p.cislo_vestnika = json['cisloVestnika']
      p.cislo_zverejnenia_vo_vestniku = json['cisloZverejneniaVoVestniku']
      p.datum_zverejnenia_vo_vestniku = json['datumZverejneniaVoVestniku']
      p.doplnujuce_predmety_doplnkovy_slovnik = find_or_create_codelist_values_by_json(json['doplnujucePredmetyDoplnkovySlovnik'], downloader)
      p.doplnujuce_predmety_hlavny_slovnik = find_or_create_codelist_values_by_json(json['doplnujucePredmetyHlavnySlovnik'], downloader)
      p.druh_zakazky = find_or_create_codelist_value_by_json(json['druhZakazky'], downloader)
      p.hlavny_predmet_doplnkovy_slovnik = find_or_create_codelist_values_by_json(json['hlavnyPredmetDoplnkovySlovnik'], downloader)
      p.hlavny_predmet_hlavny_slovnik = find_or_create_codelist_value_by_json(json['hlavnyPredmetHlavnySlovnik'], downloader)
      p.kod = json['kod']
      p.kriterium_na_vyhodnotenie_ponuk = json['kriteriumNaVyhodnoteniePonuk']
      p.lehota_na_predkladanie_ponuk = json['lehotaNaPredkladaniePonuk']
      p.lehota_na_predkladanie_ziadosti_o_ucast = json['lehotaNaPredkladanieZiadostiOUcast']
      p.metoda_vo = find_or_create_codelist_value_by_json(json['metodaVo'], downloader)
      p.nazov = json['nazov']
      p.obmedzenie_poctu_uchadzacov = json['obmedzeniePoctuUchadzacov']
      p.obstaravatel_dodavatel_obstaravatel = find_or_create_supplier_by_json(json['obstaravatelDodavatelObstaravatel'], downloader)
      p.obstaravatel_subjekt = find_or_create_subject_by_json(json['obstaravatelSubjekt'], downloader)
      p.operacne_programy = find_or_create_operational_programs_by_json(json['operacneProgramy'], downloader)
      p.pocet_prijatych_ponuk = json['pocetPrijatychPonuk']
      p.pocet_vylucenych_ponuk = json['pocetVylucenychPonuk']
      p.postup_obstaravania = find_or_create_codelist_value_by_json(json['postupObstaravania'], downloader)
      p.predchadzajuce_oznamenie = json['predchadzajuceOznamenie']
      p.predpokladana_hodnota_zakazky = json['predpokladanaHodnotaZakazky']
      p.projekty = find_or_create_projects_by_json(json['projekty'], downloader)
      p.stav = json['stav']
      p.trvanie_zakazky_hodnota = json['trvanieZakazkyHodnota']
      p.trvanie_zakazky_merna_jednotka = json['trvanieZakazkyMernaJednotka']
      p.uctovne_doklady = find_or_create_accounting_documents_by_json(json['uctovneDoklady'], downloader)
      p.url_odkaz_oznamenie = json['urlOdkazOznamenie']
      p.zadavanie_zakazky_v_mene_inych_obstaravatelov = json['zadavanieZakazkyVMeneInychObstaravatelov']
      p.zadavatel = find_or_create_subject_by_json(json['zadavatel'], downloader)
      p.zakazka_rozdelena_na_viac_casti = json['zakazkaRozdelenaNaViacCasti']
      p.zverejnene_vo_vestniku_eu = json['zverejneneVoVestnikuEU']
      p.save!
    end
  end

  private

  def find_or_create_supplier_by_json(json, downloader)
    return if json.blank?
    existing_object = Itms::Supplier.find_by(itms_id: json['id'])
    return existing_object if existing_object.present?

    Itms::SyncSupplierJob.perform_now(json['href'], downloader: downloader)
    Itms::Supplier.find_by!(itms_id: json['id'])
  end

  def find_or_create_projects_by_json(json, downloader)
    return [] if json.blank?
    json.map { |j| find_or_create_project_by_json(j, downloader) }
  end

  def find_or_create_project_by_json(json, downloader)
    return if json.blank?
    existing_object = Itms::Project.find_by(itms_id: json['id'])
    return existing_object if existing_object.present?

    Itms::SyncProjectJob.perform_now(json['href'], downloader: downloader)
    Itms::Project.find_by!(itms_id: json['id'])
  end

  def find_or_create_accounting_documents_by_json(json, downloader)
    return [] if json.blank?
    json.map { |j| find_or_create_accounting_document_by_json(j, downloader) }
  end

  def find_or_create_accounting_document_by_json(json, downloader)
    return if json.blank?
    existing_object = Itms::AccountingDocument.find_by(itms_id: json['id'])
    return existing_object if existing_object.present?

    Itms::SyncAccountingDocumentJob.perform_now(json['href'], downloader: downloader)
    Itms::AccountingDocument.find_by!(itms_id: json['id'])
  end
end