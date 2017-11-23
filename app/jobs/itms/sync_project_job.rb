class Itms::SyncProjectJob < ItmsJob
  def perform(itms_href, downloader: ItmsJob::Downloader)
    json = downloader.get_json_from_href(itms_href)

    ActiveRecord::Base.transaction do
      p = Itms::Project.find_or_create_by!(itms_id: json['id'])
      p.itms_href = json['href']
      p.itms_created_at = json['createdAt']
      p.itms_updated_at = json['updatedAt']

      p.akronym = json['akronym']
      p.aktivity = find_or_create_activities_by_json(json['aktivity'], downloader)
      p.cislo_zmluvy = json['cisloZmluvy']
      p.datum_konca_hlavnych_aktivit = json['datumKoncaHlavnychAktivit']
      p.datum_konca_realizacie = json['datumKoncaRealizacie']
      p.datum_platnosti_zmluvy = json['datumPlatnostiZmluvy']
      p.datum_ucinnosti_zmluvy = json['datumUcinnostiZmluvy']
      p.datum_zaciatku_hlavnych_aktivit = json['datumZaciatkuHlavnychAktivit']
      p.datum_zaciatku_realizacie = json['datumZaciatkuRealizacie']
      p.dlzka_celkova_hlavnych_aktivit = json['dlzkaCelkovaHlavnychAktivit']
      p.dlzka_celkova_projektu = json['dlzkaCelkovaProjektu']
      p.formy_financovania = find_or_create_specific_goals_with_codelist_values_by_json(json['formyFinancovania'], downloader)
      p.hospodarske_cinnosti = find_or_create_specific_goals_with_codelist_values_by_json(json['hospodarskeCinnosti'], downloader)
      p.intenzity = find_or_create_intensities_by_json(json['intenzity'], downloader)
      p.kod = json['kod']
      p.meratelne_ukazovatele = find_or_create_measurable_indicators_by_json(json['meratelneUkazovatele'], p.meratelne_ukazovatele, downloader)
      p.miesta_realizacie = find_or_create_implementation_places_by_json(json['miestaRealizacie'], downloader)
      p.miesta_realizacie_mimo_uzemia_op = find_or_create_implementation_places_by_json(json['miestaRealizacieMimoUzemiaOP'], downloader)
      p.monitorovacie_terminy = find_or_create_monitoring_dates_by_json(json['monitorovacieTerminy'], p.monitorovacie_terminy)
      p.nazov = json['nazov']
      p.oblasti_intervencie = find_or_create_specific_goals_with_codelist_values_by_json(json['oblastiIntervencie'], downloader)
      p.organizacne_zlozky = find_or_create_organisational_units_by_json(json['organizacneZlozky'])
      p.otvorena_zmena = json['otvorenaZmena']
      p.otvoreny_dodatok = json['otvorenyDodatok']
      p.partneri = find_or_create_subjects_by_json(json['partneri'], downloader)
      p.polozky_rozpoctu = find_or_create_budget_items_by_json(json['polozkyRozpoctu'], downloader)
      p.popis_projektu = json['popisProjektu']
      p.popis_situacie_po_realizacii = json['popisSituaciePoRealizacii']
      p.popis_sposobu_realizacie = json['popisSposobuRealizacie']
      p.popis_vychodiskovej_situacie = json['popisVychodiskovejSituacie']
      p.popis_kapacity_prijimatela = json['popiskapacityprijimatela']
      p.prijimatel = find_or_create_subject_by_json(json['prijimatel'], downloader)
      p.schvalena_zonfp = find_or_create_nrfc_application_by_json(json['schvalenaZonfp'], downloader)
      p.sekundarny_tematicky_okruh = find_or_create_specific_goals_with_codelist_values_by_json(json['sekundarnyTematickyOkruh'], downloader)
      p.stav = json['stav']
      p.suma_celkova_projektov_generujucich_prijem = json['sumaCelkovaProjektovGenerujucichPrijem']
      p.suma_zazmluvnena = json['sumaZazmluvnena']
      p.suma_zazmluvnena_povodna = json['sumaZazmluvnenaPovodna']
      p.typy_uzemia = find_or_create_specific_goals_with_codelist_values_by_json(json['typyUzemia'], downloader)
      p.url_adresa_zmluva = json['urlAdresaZmluva']
      p.uzemne_mechanizmy = find_or_create_specific_goals_with_codelist_values_by_json(json['uzemneMechanizmy'], downloader)
      p.vyzva = find_or_create_announced_proposal_call_by_json(json['vyzva'], downloader)
      p.zameranie_projektu = json['zameranieProjektu']

      p.save!
    end
  end

  private

  def find_or_create_monitoring_dates_by_json(json, scope)
    return [] if json.blank?

    json.map do |j|
      scope.find_or_create_by(
        datum_predlozenia_najneskorsi: j['datumPredlozeniaNajneskorsi'],
        poradove_cislo: j['poradoveCislo'],
        termin_monitorovania: j['terminMonitorovania'],
        typ_monitorovacej_spravy: j['typMonitorovacejSpravy'],
      )
    end
  end
end
