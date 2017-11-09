require 'harvester_utils/downloader'

class Itms::SyncAccountsReceivableDocumentJob < ItmsJob
  def perform(itms_id, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk/v2/pohladavkovyDoklad/#{itms_id}")
    json = JSON.parse(response.body)

    ActiveRecord::Base.transaction do
      ard = Itms::AccountsReceivableDocument.find_or_initialize_by(itms_id: itms_id)
      ard.itms_href = json['href']
      ard.itms_created_at = json['createdAt']
      ard.itms_updated_at = json['updatedAt']
      ard.save!

      ard.datum_splatnosti = json['datumSplatnosti']
      ard.datum_vzniku = json['datumVzniku']
      ard.dlznik = find_or_create_subject_by_json(json['dlznik'], downloader)
      ard.dopad_na_rozpocet_eu = json['dopadNaRozpocetEU']
      ard.dovod_vratenia = find_or_create_codelist_value_by_json(json['dovodVratenia'], downloader)
      ard.druh = json['druh']
      ard.kod = json['kod']
      ard.konkretny_ciel = find_or_create_specific_goal_by_json(json['konkretnyCiel'], downloader)
      ard.nezrovnalost = find_or_create_discrepancy_by_json(json['nezrovnalost'], downloader)
      ard.prioritna_os = find_or_create_priority_axis_by_json(json['prioritnaOs'], downloader)
      ard.stav = json['stav']
      ard.subjekt_zodpovedny_za_vymahanie = find_or_create_subject_by_json(json['subjektZodpovednyZaVymahanie'], downloader)
      ard.suma_na_vratenie = json['sumaNaVratenie']
      ard.suma_na_vratenie_zdroj_eu = json['sumaNaVratenieZdrojEU']
      ard.suma_na_vratenie_zdroj_pr = json['sumaNaVratenieZdrojPR']
      ard.suma_na_vratenie_zdroj_sr = json['sumaNaVratenieZdrojSR']
      ard.typ = json['typ']
      ard.vracia_sa_do_rozpoctu_projektu = json['vraciaSaDoRozpoctuProjektu']
      ard.vratena_suma = json['vratenaSuma']
      ard.vratena_suma_zdroj_eu = json['vratenaSumaZdrojEU']
      ard.vratena_suma_zdroj_pr = json['vratenaSumaZdrojPR']
      ard.vratena_suma_zdroj_sr = json['vratenaSumaZdrojSR']

      ard.save!
    end
  end
end