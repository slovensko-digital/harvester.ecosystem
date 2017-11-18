require 'harvester_utils/downloader'

class Itms::SyncNrfcApplicationJob < ItmsJob
  def perform(itms_href, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk#{itms_href}")
    json = JSON.parse(response.body)
    itms_id = itms_href.split('/').last

    ActiveRecord::Base.transaction do
      na = Itms::NrfcApplication.find_or_create_by!(itms_id: itms_id)

      na.itms_href = json['href']
      na.itms_created_at = json['createdAt']
      na.itms_updated_at = json['updatedAt']

      na.akronym = json['akronym']
      na.aktivity_projekt = find_or_create_activities_by_json(json['aktivityProjekt'], na.aktivity_projekt, downloader)
      na.datum_predlozenia = json['datumPredlozenia']
      na.datum_ziadany_konca_hlavnych_aktivit = json['datumZiadanyKoncaHlavnychAktivit']
      na.datum_ziadany_konca_realizacie = json['datumZiadanyKoncaRealizacie']
      na.datum_ziadany_zaciatku_hlavnych_aktivit = json['datumZiadanyZaciatkuHlavnychAktivit']
      na.datum_ziadany_zaciatku_realizacie = json['datumZiadanyZaciatkuRealizacie']
      na.formy_financovania = find_or_create_specific_goals_with_codelist_values_by_json(json['formyFinancovania'], na.formy_financovania, downloader)
      na.hospodarske_cinnosti = find_or_create_specific_goals_with_codelist_values_by_json(json['hospodarskeCinnosti'], na.hospodarske_cinnosti, downloader)
      na.kod = json['kod']
      na.meratelne_ukazovatele = find_or_create_measurable_indicators_by_json(json['meratelneUkazovatele'], na.meratelne_ukazovatele, downloader)
      na.miesta_realizacie = find_or_create_implementation_places_by_json(json['miestaRealizacie'], downloader)
      na.miesta_realizacie_mimo_uzemia_op = find_or_create_implementation_places_by_json(json['miestaRealizacieMimoUzemiaOP'], downloader)
      na.nazov = json['nazov']
      na.oblasti_intervencie = find_or_create_specific_goals_with_codelist_values_by_json(json['oblastiIntervencie'], na.oblasti_intervencie, downloader)
      na.organizacne_zlozky = find_or_create_organisational_units_by_json(json['organizacneZlozky'])
      na.partneri = find_or_create_subjects_by_json(json['partneri'], downloader)
      na.percento_ziadane_spolufinancovania = json['percentoZiadaneSpolufinancovania']
      na.polozky_rozpoctu = find_or_create_nrfc_request_budget_items_by_json(json['polozkyRozpoctu'], na.polozky_rozpoctu, downloader)
      na.popis_projektu = json['popisProjektu']
      na.sekundarny_tematicky_okruh = find_or_create_specific_goals_with_codelist_values_by_json(json['sekundarnyTematickyOkruh'], na.sekundarny_tematicky_okruh, downloader)
      na.suma_ziadana_celkova = json['sumaZiadanaCelkova']
      na.suma_ziadana_celkova_projektov_generujucich_prijem = json['sumaZiadanaCelkovaProjektovGenerujucichPrijem']
      na.suma_ziadana_nfp = json['sumaZiadanaNFP']
      na.suma_ziadana_vlastnych_zdrojov = json['sumaZiadanaVlastnychZdrojov']
      na.typy_uzemia = find_or_create_specific_goals_with_codelist_values_by_json(json['typyUzemia'], na.typy_uzemia, downloader)
      na.vyzva = find_or_create_announced_proposal_call_by_json(json['vyzva'], downloader)
      na.zameranie_projektu = json['zameranieProjektu']
      na.ziadatel = find_or_create_subject_by_json(json['ziadatel'], downloader)
      
      na.save!
    end
  end

  private

  def find_or_create_activities_by_json(json_list, scope, downloader)
    return [] if json_list.blank?

    json_list.map do |json|
      activity_type = find_or_create_activity_type_by_json(json['typAktivity'], downloader)
      pa = scope.find_or_initialize_by(typ_aktivity: activity_type)

      pa.datum_konca_planovany = json['datumKoncaPlanovany']
      pa.datum_zaciatku_planovany = json['datumZaciatkuPlanovany']
      pa.kod = json['kod']
      pa.nazov = json['nazov']
      pa.subjekt = find_or_create_subject_by_json(json['subjekt'], downloader)

      pa
    end
  end

  def find_or_create_nrfc_request_budget_items_by_json(json_list, scope, downloader)
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
