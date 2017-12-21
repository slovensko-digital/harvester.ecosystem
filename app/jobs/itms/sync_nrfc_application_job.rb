class Itms::SyncNrfcApplicationJob < ItmsJob
  def perform(itms_href, downloader: ItmsJob::Downloader)
    itms_id = itms_href.split('/').last

    sync_received(itms_id, downloader)
    sync_processed('/v2/zonfp/schvalene/', itms_id, downloader)
    sync_processed('/v2/zonfp/zamietnute/', itms_id, downloader)
  end

  private

  def sync_received(itms_id, downloader)
    json = downloader.get_json_from_href("/v2/zonfp/prijate/#{itms_id}")

    ActiveRecord::Base.transaction do
      na = Itms::NrfcApplicationReceived.find_or_create_by!(itms_id: itms_id)

      sync_common_attributes(na, json, downloader)
      na.datum_predlozenia = json['datumPredlozenia']

      na.save!
    end
  end

  def sync_processed(href_root, itms_id, downloader)
    href = "#{href_root}#{itms_id}"
    return unless downloader.href_exists?(href)
    json = downloader.get_json_from_href(href)

    ActiveRecord::Base.transaction do
      na = Itms::NrfcApplicationProcessed.find_or_create_by!(itms_id: itms_id)
      na.ekosystem_stav = json['href'].split('/')[3]

      sync_common_attributes(na, json, downloader)
      sync_processed_attributes(na, json, downloader)

      na.save!
    end
  end

  def sync_common_attributes(nrfc_application, json, downloader)
    na = nrfc_application

    na.itms_href = json['href']
    na.itms_created_at = json['createdAt']
    na.itms_updated_at = json['updatedAt']

    na.akronym = json['akronym']
    na.aktivity_projekt = find_or_create_activities_by_json(json['aktivityProjekt'], na.aktivity_projekt, downloader)
    na.datum_ziadany_konca_hlavnych_aktivit = json['datumZiadanyKoncaHlavnychAktivit']
    na.datum_ziadany_konca_realizacie = json['datumZiadanyKoncaRealizacie']
    na.datum_ziadany_zaciatku_hlavnych_aktivit = json['datumZiadanyZaciatkuHlavnychAktivit']
    na.datum_ziadany_zaciatku_realizacie = json['datumZiadanyZaciatkuRealizacie']
    na.formy_financovania = find_or_create_specific_goals_with_codelist_values_by_json(json['formyFinancovania'], downloader)
    na.hospodarske_cinnosti = find_or_create_specific_goals_with_codelist_values_by_json(json['hospodarskeCinnosti'], downloader)
    na.kod = json['kod']
    na.meratelne_ukazovatele = find_or_create_measurable_indicators_by_json(json['meratelneUkazovatele'], na.meratelne_ukazovatele, downloader)
    na.miesta_realizacie = find_or_create_implementation_places_by_json(json['miestaRealizacie'], downloader)
    na.miesta_realizacie_mimo_uzemia_op = find_or_create_implementation_places_by_json(json['miestaRealizacieMimoUzemiaOP'], downloader)
    na.nazov = json['nazov']
    na.oblasti_intervencie = find_or_create_specific_goals_with_codelist_values_by_json(json['oblastiIntervencie'], downloader)
    na.organizacne_zlozky = find_or_create_organisational_units_by_json(json['organizacneZlozky'])
    na.partneri = find_or_create_subjects_by_json(json['partneri'], downloader)
    na.percento_ziadane_spolufinancovania = json['percentoZiadaneSpolufinancovania']
    na.polozky_rozpoctu = find_or_create_nrfc_application_budget_items_by_json(json['polozkyRozpoctu'], na.polozky_rozpoctu, downloader)
    na.popis_projektu = json['popisProjektu']
    na.sekundarny_tematicky_okruh = find_or_create_specific_goals_with_codelist_values_by_json(json['sekundarnyTematickyOkruh'], downloader)
    na.suma_ziadana_celkova = json['sumaZiadanaCelkova']
    na.suma_ziadana_celkova_projektov_generujucich_prijem = json['sumaZiadanaCelkovaProjektovGenerujucichPrijem']
    na.suma_ziadana_nfp = json['sumaZiadanaNFP']
    na.suma_ziadana_vlastnych_zdrojov = json['sumaZiadanaVlastnychZdrojov']
    na.typy_uzemia = find_or_create_specific_goals_with_codelist_values_by_json(json['typyUzemia'], downloader)
    na.uzemne_mechanizmy = find_or_create_specific_goals_with_codelist_values_by_json(json['uzemneMechanizmy'], downloader)
    na.vyzva = find_or_create_announced_proposal_call_by_json(json['vyzva'], downloader)
    na.zameranie_projektu = json['zameranieProjektu']
    na.ziadatel = find_or_create_subject_by_json(json['ziadatel'], downloader)
  end

  def sync_processed_attributes(nrfc_application, json, downloader)
    na = nrfc_application

    na.datum_schvalenia = json['datumSchvalenia']
    na.datum_schvaleny_konca_hlavnych_aktivit = json['datumSchvalenyKoncaHlavnychAktivit']
    na.datum_schvaleny_konca_realizacie = json['datumSchvalenyKoncaRealizacie']
    na.datum_schvaleny_zaciatku_hlavnych_aktivit = json['datumSchvalenyZaciatkuHlavnychAktivit']
    na.datum_schvaleny_zaciatku_realizacie = json['datumSchvalenyZaciatkuRealizacie']
    na.datum_zamietnutia = json['datumZamietnutia']
    na.hodnotitelia = find_or_create_persons_by_json(json['hodnotitelia'])
    na.percento_schvalene_spolufinancovania = json['percentoSchvaleneSpolufinancovania']
    na.pocet_bodov_hodnotenia_celkovy = json['pocetBodovHodnoteniaCelkovy']
    na.popis_kapacity_ziadatela = json['popisKapacityZiadatela']
    na.popis_situacie_po_realizacii = json['popisSituaciePoRealizacii']
    na.popis_sposobu_realizacie = json['popisSposobuRealizacie']
    na.popis_vychodiskovej_situacie = json['popisVychodiskovejSituacie']
    na.suma_schvalena_celkova = json['sumaSchvalenaCelkova']
    na.suma_schvalena_celkova_projektov_generujucich_prijem = json['sumaSchvalenaCelkovaProjektovGenerujucichPrijem']
    na.suma_schvalena_nfp = json['sumaSchvalenaNFP']
    na.suma_schvalena_vlastnych_zdrojov = json['sumaSchvalenaVlastnychZdrojov']
    na.vysledok_konania = find_or_create_codelist_value_by_json(json['vysledokKonania'], downloader)
  end

  def find_or_create_activities_by_json(json_list, scope, downloader)
    return [] if json_list.blank?

    current_activities = scope.all
    json_list.each_with_index.map do |json, index|
      ca = current_activities[index] || scope.new

      ca.datum_konca_planovany = json['datumKoncaPlanovany']
      ca.datum_konca_schvaleny = json['datumKoncaSchvaleny']
      ca.datum_zaciatku_planovany = json['datumZaciatkuPlanovany']
      ca.datum_zaciatku_schvaleny = json['datumZaciatkuSchvaleny']
      ca.kod = json['kod']
      ca.nazov = json['nazov']
      ca.subjekt = find_or_create_subject_by_json(json['subjekt'], downloader)
      ca.typ_aktivity = find_or_create_activity_type_by_json(json['typAktivity'], downloader)
      ca.save!

      ca
    end
  end

  def find_or_create_nrfc_application_budget_items_by_json(json_list, scope, downloader)
    return [] if json_list.blank?

    json_list.map do |json|
      bi = scope.find_or_initialize_by(itms_id: json['id'])

      bi.aktivita_zonfp_kod = json['aktivitaZonfpKod']
      bi.skupina_vydavkov = find_or_create_codelist_value_by_json(json['skupinaVydavkov'], downloader)
      bi.suma_opravneneho_vydavku = json['sumaOpravnenehoVydavku']
      bi.save!

      bi
    end
  end
end
