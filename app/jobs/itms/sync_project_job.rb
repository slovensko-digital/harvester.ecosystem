require 'harvester_utils/downloader'

class Itms::SyncProjectJob < ItmsJob
  def perform(itms_href, downloader: HarvesterUtils::Downloader)
    response = downloader.get("https://opendata.itms2014.sk#{itms_href}")
    json = JSON.parse(response.body)
    _, _, _, _, itms_id = itms_href.split('/')

    ActiveRecord::Base.transaction do
      p = Itms::Project.find_or_initialize_by(itms_id: itms_id)
      p.itms_href = json['href']
      p.itms_created_at = json['createdAt']
      p.itms_updated_at = json['updatedAt']
      p.save!

      p.akronym = json['akronym']
      p.aktivity = find_or_create_project_activities_by_json(json['aktivity'], downloader)
      p.cislo_zmluvy = json['cisloZmluvy']
      #TODO p.data_projektu = json['dataProjektu']
      p.datum_konca_hlavnych_aktivit = json['datumKoncaHlavnychAktivit']
      p.datum_konca_realizacie = json['datumKoncaRealizacie']
      p.datum_platnosti_zmluvy = json['datumPlatnostiZmluvy']
      p.datum_ucinnosti_zmluvy = json['datumUcinnostiZmluvy']
      p.datum_zaciatku_hlavnych_aktivit = json['datumZaciatkuHlavnychAktivit']
      p.datum_zaciatku_realizacie = json['datumZaciatkuRealizacie']
      p.dlzka_celkova_hlavnych_aktivit = json['dlzkaCelkovaHlavnychAktivit']
      p.dlzka_celkova_projektu = json['dlzkaCelkovaProjektu']
      p.formy_financovania = find_or_create_codelist_values_with_goals_by_json(json['formyFinancovania'], p.formy_financovania, downloader)
      p.hospodarske_cinnosti = find_or_create_codelist_values_with_goals_by_json(json['hospodarskeCinnosti'], p.hospodarske_cinnosti, downloader)
      p.intenzity = find_or_create_intensities_by_json(json['intenzity'], downloader)
      p.kod = json['kod']
      p.meratelne_ukazovatele = find_or_create_measurable_indicators_by_json(json['meratelneUkazovatele'], p.meratelne_ukazovatele, downloader)
      #TODO p.miesta_realizacie = json['miestaRealizacie']
      #TODO p.monitorovacie_terminy = json['monitorovacieTerminy']
      p.nazov = json['nazov']
      p.oblasti_intervencie = find_or_create_codelist_values_with_goals_by_json(json['oblastiIntervencie'], p.oblasti_intervencie, downloader)
      #TODO p.organizacne_zlozky = json['organizacneZlozky']
      p.otvorena_zmena = json['otvorenaZmena']
      p.otvoreny_dodatok = json['otvorenyDodatok']
      #TODO p.partneri = json['partneri']
      #TODO p.polozky_rozpoctu = json['polozkyRozpoctu']
      p.popis_projektu = json['popisProjektu']
      p.prijimatel = find_or_create_subject_by_json(json['prijimatel'], downloader)
      #TODO p.schvalena_zonfp = json['schvalenaZonfp']
      p.sekundarny_tematicky_okruh = find_or_create_codelist_values_with_goals_by_json(json['sekundarnyTematickyOkruh'], p.sekundarny_tematicky_okruh, downloader)
      p.stav = json['stav']
      p.suma_celkova_projektov_generujucich_prijem = json['sumaCelkovaProjektovGenerujucichPrijem']
      p.suma_zazmluvnena = json['sumaZazmluvnena']
      p.suma_zazmluvnena_povodna = json['sumaZazmluvnenaPovodna']
      p.typy_uzemia = find_or_create_codelist_values_with_goals_by_json(json['typyUzemia'], p.typy_uzemia, downloader)
      p.url_adresa_zmluva = json['urlAdresaZmluva']
      p.uzemne_mechanizmy = find_or_create_codelist_values_with_goals_by_json(json['uzemneMechanizmy'], p.uzemne_mechanizmy, downloader)
      #TODO p.vyzva = json['vyzva']
      p.zameranie_projektu = json['zameranieProjektu']

      p.save!
    end
  end

  private

  def find_or_create_intensities_by_json(json, downloader)
    return [] if json.blank?
    json.map { |json| find_or_create_intensity_by_json(json, downloader) }
  end

  def find_or_create_intensity_by_json(json, downloader)
    return if json.blank?
    intensity = Itms::Intensity.find_by(itms_id: json['id'])
    return intensity if intensity.present?

    Itms::SyncIntensityJob.perform_now(json['href'], downloader: downloader)
    Itms::Intensity.find_by!(itms_id: json['id'])
  end

  def find_or_create_project_activities_by_json(json, downloader)
    return [] if json.blank?
    json.map { |json| find_or_create_project_activity_by_json(json, downloader) }
  end

  def find_or_create_project_activity_by_json(json, downloader)
    return if json.blank?
    project_activity = Itms::ProjectActivity.find_by(itms_id: json['id'])
    return project_activity if project_activity.present?

    Itms::SyncProjectActivityJob.perform_now(json['href'], downloader: downloader)
    Itms::ProjectActivity.find_by!(itms_id: json['id'])
  end

  def find_or_create_codelist_values_with_goals_by_json(json, scope, downloader)
    return [] if json.blank?
    json.map { |json| find_or_create_codelist_value_with_goal_by_json(json, scope, downloader) }
  end

  def find_or_create_codelist_value_with_goal_by_json(json, scope, downloader)
    return if json.blank?
    existing_object = scope.where_goal_and_codelist(
        json['konkretnyCiel']['id'],
        json['hodnotaCiselnika']['ciselnikKod'],
        json['hodnotaCiselnika']['id'],
    ).first
    return existing_object if existing_object.present?

    codelist_value = find_or_create_codelist_value_by_json(json['hodnotaCiselnika'], downloader)
    specific_goal = find_or_create_specific_goal_by_json(json['konkretnyCiel'], downloader)
    scope.create!(hodnota_ciselnika: codelist_value, konkretny_ciel: specific_goal)
  end

  def find_or_create_measurable_indicators_by_json(json, project_scope, downloader)
    return [] if json.blank?
    json.map { |indicator_json| find_or_create_measurable_indicator_by_json(indicator_json, project_scope, downloader) }
  end

  def find_or_create_measurable_indicator_by_json(json, project_scope, downloader)
    return if json.blank?

    project_indicator = find_or_create_project_indicator_by_json_link(json['projektovyUkazovatel'], downloader)
    mi = project_scope.find_or_initialize_by(projektovy_ukazovatel: project_indicator)
    mi.aktualny_skutocny_stav = json['aktualnySkutocnyStav'] ? json['aktualnySkutocnyStav'].to_d : nil
    mi.datum_posledneho_merania = json['datumPoslednehoMerania']
    mi.hodnota_cielova_celkova = json['hodnotaCielovaCelkova'] ? json['hodnotaCielovaCelkova'].to_d : nil
    mi.priznak_rizika = json['priznakRizika']
    mi.save!

    mi
  end

  def find_or_create_project_indicator_by_json_link(json, downloader)
    return if json.blank?
    existing_object = Itms::ProjectIndicator.find_by(itms_id: json['id'])
    return existing_object if existing_object.present?

    Itms::SyncProjectIndicatorJob.perform_now(json['href'], downloader: downloader)
    Itms::ProjectIndicator.find_by!(itms_id: json['id'])
  end
end
