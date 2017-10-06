require 'harvester_utils/downloader'

class Itms::SyncDiscrepancyJob < ApplicationJob
  def perform(itms_id, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk/v2/nezrovnalost/#{itms_id}")
    json = JSON.parse(response.body)

    d = Itms::Discrepancy.find_or_initialize_by(itms_id: itms_id)

    d.itms_href = json['href']
    d.itms_created_at = json['createdAt']
    d.itms_updated_at = json['updatedAt']
    
    d.administrativny_stav = find_or_initialize_code_by_json(json['administrativnyStav'])
    d.celkova_suma_nezrovnalosti = json['celkovaSumaNezrovnalosti']
    d.celkova_suma_nezrovnalosti_zdroj_eu = json['celkovaSumaNezrovnalostiZdrojEU']
    d.celkova_suma_nezrovnalosti_zdroj_pr = json['celkovaSumaNezrovnalostiZdrojPR']
    d.celkova_suma_nezrovnalosti_zdroj_sr = json['celkovaSumaNezrovnalostiZdrojSR']
    d.datum_prvej_informacie = json['datumPrvejInformacie']
    d.datum_zistenia = json['datumZistenia']
    d.dlznik = find_or_create_subject_by_json(json['dlznik'], downloader)
    d.dopad_na_rozpocet_eu = json['dopadNaRozpocetEU']
    d.druh_nezrovnalosti = json['druhNezrovnalosti']
    d.financny_stav = find_or_initialize_code_by_json(json['financnyStav'])
    d.hlavny_typ_nezrovnalosti = find_or_initialize_code_by_json(json['hlavnyTypNezrovnalosti'])
    d.je_systemova = json['jeSystemova']
    d.kod = json['kod']
    #TODO :konkretny_ciel
    #TODO :operacny_program
    d.penale = json['penale']
    d.pokuty = json['pokuty']
    d.popis = json['popis']
    d.pouzite_praktiky = json['pouzitePraktiky']
    #TODO :prioritna_os
    #TODO :projekt
    d.projekt_v_priprave_alebo_nerealizovany = json['projektVPripraveAleboNerealizovany']
    d.stanovisko_dlznika = json['stanoviskoDlznika']
    d.stanovisko_organu = json['stanoviskoOrganu']
    d.stav = json['stav']
    d.subjekty_ktore_sposobili_nezrovnalost = find_or_create_subjects_by_json(json['subjektyKtoreSposobiliNezrovnalost'], downloader)
    d.subjekty_ktore_zistili_nezrovnalost = find_or_create_subjects_by_json(json['subjektyKtoreZistiliNezrovnalost'], downloader)
    d.subjekty_zodpovedne_za_nasledne_konanie = find_or_create_subjects_by_json(json['subjektyZodpovedneZaNasledneKonanie'], downloader)
    d.suma_na_vymahanie = json['sumaNaVymahanie']
    d.suma_na_vymahanie_zdroj_eu = json['sumaNaVymahanieZdrojEU']
    d.suma_na_vymahanie_zdroj_pr = json['sumaNaVymahanieZdrojPR']
    d.suma_na_vymahanie_zdroj_sr = json['sumaNaVymahanieZdrojSR']
    # TODO :suvisiace_nezrovnalosti
    # TODO :suvisiace_pohladavkove_doklady
    # TODO :suvisiace_verejne_obstaravania
    # TODO :suvisiace_zop
    # TODO :typy_nezrovnalosti
    d.vratena_suma = json['vratenaSuma']
    d.vratena_suma_zdroj_eu = json['vratenaSumaZdrojEU']
    d.vratena_suma_zdroj_pr = json['vratenaSumaZdrojPR']
    d.vratena_suma_zdroj_sr = json['vratenaSumaZdrojSR']

    d.save!
  end

  private

  def find_or_initialize_code_by_json(json)
    Itms::Code.find_or_initialize_by(
      kod_id: json['id'],
      kod_zdroj: json['kodZdroj'],
      nazov: json['nazov']
    )
  end

  def find_or_create_subject_by_json(json, downloader)
    unit = Itms::Subject.find_by(itms_id: json['id'])
    return unit if unit.present?

    Itms::SyncSubjectJob.perform_now(json['id'], downloader: downloader)
    Itms::Subject.find_by!(itms_id: json['id'])
  end

  def find_or_create_subjects_by_json(json, downloader)
    return [] if json.blank?
    json.map { |subject_json| find_or_create_subject_by_json(subject_json, downloader) }
  end
end