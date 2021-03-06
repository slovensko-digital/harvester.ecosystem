class Itms::SyncDiscrepancyJob < ItmsJob
  def perform(itms_href, downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href(itms_href)

    ActiveRecord::Base.transaction do
      d = Itms::Discrepancy.find_or_create_by!(itms_id: json['id'])
      d.itms_href = json['href']
      d.itms_created_at = json['createdAt']
      d.itms_updated_at = json['updatedAt']

      d.administrativny_stav = find_or_create_codelist_value_by_json(json['administrativnyStav'], downloader)
      d.celkova_suma_nezrovnalosti = json['celkovaSumaNezrovnalosti']
      d.celkova_suma_nezrovnalosti_zdroj_eu = json['celkovaSumaNezrovnalostiZdrojEU']
      d.celkova_suma_nezrovnalosti_zdroj_pr = json['celkovaSumaNezrovnalostiZdrojPR']
      d.celkova_suma_nezrovnalosti_zdroj_sr = json['celkovaSumaNezrovnalostiZdrojSR']
      d.datum_prvej_informacie = json['datumPrvejInformacie']
      d.datum_zistenia = json['datumZistenia']
      d.dlznik = find_or_create_subject_by_json(json['dlznik'], downloader)
      d.dopad_na_rozpocet_eu = json['dopadNaRozpocetEU']
      d.druh_nezrovnalosti = json['druhNezrovnalosti']
      d.financny_stav = find_or_create_codelist_value_by_json(json['financnyStav'], downloader)
      d.hlavny_typ_nezrovnalosti = find_or_create_codelist_value_by_json(json['hlavnyTypNezrovnalosti'], downloader)
      d.je_systemova = json['jeSystemova']
      d.kod = json['kod']
      d.konkretny_ciel = find_or_create_specific_goal_by_json(json['konkretnyCiel'], downloader)
      d.operacny_program = find_or_create_operational_program_by_json(json['operacnyProgram'], downloader)
      d.penale = json['penale']
      d.pokuty = json['pokuty']
      d.popis = json['popis']
      d.pouzite_praktiky = json['pouzitePraktiky']
      d.prioritna_os = find_or_create_priority_axis_by_json(json['prioritnaOs'], downloader)
      d.projekt = find_or_create_project_by_json(json['projekt'], downloader)
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
      d.suvisiace_nezrovnalosti = find_or_create_discrepancies_by_json(json['suvisiaceNezrovnalosti'], downloader)
      d.suvisiace_pohladavkove_doklady = find_or_create_accounts_receivable_documents_by_json(json['suvisiacePohladavkoveDoklady'], downloader)
      d.suvisiace_verejne_obstaravania = find_or_create_procurements_by_json(json['suvisiaceVerejneObstaravania'], downloader)
      d.suvisiace_zop = find_or_create_payment_claims_by_json(json['suvisiaceZop'], downloader)
      d.typy_nezrovnalosti = find_or_create_codelist_values_by_json(json['typyNezrovnalosti'], downloader)
      d.vratena_suma = json['vratenaSuma']
      d.vratena_suma_zdroj_eu = json['vratenaSumaZdrojEU']
      d.vratena_suma_zdroj_pr = json['vratenaSumaZdrojPR']
      d.vratena_suma_zdroj_sr = json['vratenaSumaZdrojSR']

      d.save!
    end
  end
end
