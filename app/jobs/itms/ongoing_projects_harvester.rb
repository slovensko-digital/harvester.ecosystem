require 'harvester_utils/downloader'

class Itms::OngoingProjectsHarvester < Itms::Harvester

  def run
    list_json = load_and_parse_endpoint("https://opendata.itms2014.sk/v1/projekty/vrealizacii?minId=#{min_id}&limit=100")

    list_json.each do |list_entry_json|
      json = load_and_parse_endpoint("https://opendata.itms2014.sk#{list_entry_json['href']}")

      Itms::OngoingProject.transaction do
        begin
          project = Itms::OngoingProject.new
          project[:itms_identifier] = json['id']
          project[:akronym] = json['akronym']
          project[:cislo_zmluvy] = json['cisloZmluvy']
          project[:kod] = json['kod']
          project[:nazov] = json['nazov']
          project[:stav] = json['stav']
          project[:created_at] = json['createdAt']
          project[:updated_at] = json['updatedAt']
          project[:datum_konca_hlavnych_aktivit] = json['datumKoncaHlavnychAktivit']
          project[:datum_konca_realizacie] = json['datumKoncaRealizacie']
          project[:datum_platnosti_zmluvy] = json['datumPlatnostiZmluvy']
          project[:datum_ucinnosti_zmluvy] = json['datumUcinnostiZmluvy']
          project[:datum_zaciatku_hlavnych_aktivit] = json['datumZaciatkuHlavnychAktivit']
          project[:datum_zaciatku_realizacie] = json['datumZaciatkuRealizacie']
          project[:dlzka_celkova_hlavnych_aktivit] = json['dlzkaCelkovaHlavnychAktivit']
          project[:dlzka_celkova_projektu] = json['dlzkaCelkovaProjektu']
          project[:suma_celkova_projektov_generujucich_prijem] = json['sumaCelkovaProjektovGenerujucichPrijem']
          project[:suma_zazmluvnena] = json['sumaZazmluvnena']
          project[:suma_zazmluvnena_povodna] = json['sumaZazmluvnenaPovodna']
          project[:popis_projektu] = json['popisProjektu']
          project[:zameranie_projektu] = json['zameranieProjektu']

          save_project_activities(json, project)
          save_project_financing_forms(json, project)
          save_project_economic_activities(json, project)
          save_project_intensities(json, project)
          save_project_measurable_indicators(json, project)
          save_project_realization_places(json, project)
          save_project_monitoring_dates(json, project)
          save_intervention_areas(json, project)
          save_project_organizational_components(json, project)
          save_project_partners(json, project)
          save_project_recipient(json, project)
          save_project_territory_types(json, project)
          save_project_territorial_mechanisms(json, project)
          save_project_appeal(json, project)

          project.save!
        rescue ActiveRecord::RecordNotUnique
          Rails.logger.debug("#{project.class} #{json['id']} has been already stored")
          raise ActiveRecord::Rollback
        end
      end
    end

    rerun_if_necessary(list_json, Itms::OngoingProject)
  end

  private

  def save_project_activities(json, project)
    Array(json['aktivity']).each do |activity_json|
      activity = project.ongoing_project_activities.new
      activity[:datum_konca_planovany] = activity_json['datumKoncaPlanovany']
      activity[:datum_konca_skutocny] = activity_json['datumKoncaSkutocny']
      activity[:datum_zaciatku_planovany] = activity_json['datumZaciatkuPlanovany']
      activity[:datum_zaciatku_skutocny] = activity_json['datumZaciatkuSkutocny']
      activity[:kod] = activity_json['kod']
      activity[:nazov] = activity_json['nazov']

      unit_json = activity_json['subjekt']
      if unit_json.present?
        activity_unit = activity.build_ongoing_project_activity_unit
        activity_unit[:itms_identifier] = unit_json['id']
        activity_unit[:ico] = unit_json['ico']
        activity_unit[:ine_identifikacne_cislo] = unit_json['ineIdentifikacneCislo']
        load_and_save_unit(unit_json['href'])
      end
    end
  end

  def save_project_financing_forms(json, project)
    Array(json['formyFinancovania']).each do |financing_form_json|
      financing_form = project.ongoing_project_financing_forms.new
      financing_form[:itms_identifier] = financing_form_json['id']
      financing_form[:kod_zdroj] = financing_form_json['kodZdroj']
      financing_form[:nazov] = financing_form_json['nazov']

      goal_json = financing_form_json['konkretnyCiel']
      if goal_json.present?
        goal = financing_form.build_ongoing_project_financing_form_goal
        goal[:itms_identifier] = goal_json['id']
        load_and_save_specific_goal(goal_json['href'])
      end
    end
  end

  def save_project_economic_activities(json, project)
    Array(json['hospodarskeCinnosti']).each do |economic_activity_json|
      economic_activity = project.ongoing_project_economic_activities.new
      economic_activity[:itms_identifier] = economic_activity_json['id']
      economic_activity[:kod_zdroj] = economic_activity_json['kodZdroj']
      economic_activity[:nazov] = economic_activity_json['nazov']

      goal_json = economic_activity_json['konkretnyCiel']
      if goal_json.present?
        goal = economic_activity.build_ongoing_project_economic_activity_goal
        goal[:itms_identifier] = goal_json['id']
        load_and_save_specific_goal(goal_json['href'])
      end
    end
  end

  def save_project_intensities(json, project)
    Array(json['intenzity']).each do |intensity_json|
      intensity = project.ongoing_project_intensities.new
      intensity[:itms_identifier] = intensity_json['id']
      intensity[:nazov] = intensity_json['nazov']

      unit_json = intensity_json['subjekt']
      if unit_json.present?
        activity_unit = intensity.build_ongoing_project_intensity_unit
        activity_unit[:itms_identifier] = unit_json['id']
        activity_unit[:ico] = unit_json['ico']
        activity_unit[:ine_identifikacne_cislo] = unit_json['ineIdentifikacneCislo']
        load_and_save_unit(unit_json['href'])
      end

      %w(zdrojEu zdrojPr zdrojSr zdrojVz zdrojYei).each do |source_type|
        source_json = intensity_json[source_type]
        if source_json.present?
          activity_source = intensity.ongoing_project_intensity_sources.new(typ: source_type)
          activity_source[:itms_identifier] = source_json['id']
          activity_source[:cerpanie_eu] = source_json['cerpanieEu']
          activity_source[:cerpanie_ro] = source_json['cerpanieRo']
          activity_source[:kod] = source_json['kod']
          activity_source[:nazov] = source_json['nazov']
          activity_source[:percento] = source_json['percento']
          activity_source[:suma_zazmluvnena] = source_json['sumaZazmluvnena']
        end
      end
    end
  end

  def save_project_measurable_indicators(json, project)
    Array(json['meratelneUkazovatele']).each do |indicator_json|
      indicator = project.ongoing_project_measurable_indicators.new
      indicator[:aktualny_skutocny_stav] = indicator_json['aktualnySkutocnyStav']
      indicator[:hodnota_cielova_celkova] = indicator_json['hodnotaCielovaCelkova']
      indicator[:kod] = indicator_json['kod']
      indicator[:merna_jednotka] = indicator_json['mernaJednotka']
      indicator[:nazov] = indicator_json['nazov']
    end
  end

  def save_project_realization_places(json, project)
    Array(json['miestaRealizacie']).each do |place_json|
      place = project.ongoing_project_realization_places.new
      %w(nuts3 nuts4 nuts5 stat).each do |unit_type|
        place_unit_json = place_json[unit_type]
        if place_unit_json.present?
          place_unit = place.ongoing_project_realization_place_units.new(typ: unit_type)
          place_unit[:itms_identifier] = place_unit_json['id']
          place_unit[:nazov] = place_unit_json['nazov']
        end
      end
    end
  end

  def save_project_monitoring_dates(json, project)
    Array(json['monitorovacieTerminy']).each do |date_json|
      date = project.ongoing_project_monitoring_dates.new
      date[:datum_predlozenia_najneskorsi] = date_json['datumPredlozeniaNajneskorsi']
      date[:poradove_cislo] = date_json['poradoveCislo']
      date[:termin_monitorovania] = date_json['terminMonitorovania']
      date[:typ_monitorovacej_spravy] = date_json['typMonitorovacejSpravy']
    end
  end

  def save_intervention_areas(json, project)
    Array(json['oblastiIntervencie']).each do |area_json|
      area = project.ongoing_project_intervention_areas.new
      area[:itms_identifier] = area_json['id']
      area[:nazov] = area_json['nazov']
      area[:kod_zdroj] = area_json['kodZdroj']

      goal_json = area_json['konkretnyCiel']
      if goal_json.present?
        goal = area.build_ongoing_project_intervention_area_goal
        goal[:itms_identifier] = goal_json['id']
        load_and_save_specific_goal(goal_json['href'])
      end
    end
  end

  def save_project_organizational_components(json, project)
    Array(json['organizacneZlozky']).each do |component_json|
      component = project.ongoing_project_organizational_components.new
      component[:itms_identifier] = component_json['id']
      component[:nazov] = component_json['nazov']
      component[:adresa] = component_json['adresa']
    end
  end

  def save_project_partners(json, project)
    Array(json['partneri']).each do |partner_json|
      partner = project.ongoing_project_partners.new
      partner[:itms_identifier] = partner_json['id']
      partner[:ico] = partner_json['ico']
      partner[:ine_identifikacne_cislo] = partner_json['ineIdentifikacneCislo']
    end
  end

  def save_project_recipient(json, project)
    recipient_json = json['prijimatel']
    if recipient_json.present?
      recipient = project.build_ongoing_project_recipient
      recipient[:itms_identifier] = recipient_json['id']
      recipient[:ico] = recipient_json['ico']
      recipient[:ine_identifikacne_cislo] = recipient_json['ineIdentifikacneCislo']
    end
  end

  def save_project_territory_types(json, project)
    Array(json['typyUzemia']).each do |type_json|
      type = project.ongoing_project_territory_types.new
      type[:itms_identifier] = type_json['id']
      type[:kod_zdroj] = type_json['kodZdroj']
      type[:nazov] = type_json['nazov']

      goal_json = type_json['konkretnyCiel']
      if goal_json.present?
        goal = type.build_ongoing_project_territory_type_goal
        goal[:itms_identifier] = goal_json['id']
        load_and_save_specific_goal(goal_json['href'])
      end
    end
  end

  def save_project_territorial_mechanisms(json, project)
    Array(json['uzemneMechanizmy']).each do |mechanism_json|
      mechanism = project.ongoing_project_territorial_mechanisms.new
      mechanism[:itms_identifier] = mechanism_json['id']
      mechanism[:kod_zdroj] = mechanism_json['kodZdroj']
      mechanism[:nazov] = mechanism_json['nazov']

      goal_json = mechanism_json['konkretnyCiel']
      if goal_json.present?
        goal = mechanism.build_ongoing_project_territorial_mechanism_goal
        goal[:itms_identifier] = goal_json['id']
        load_and_save_specific_goal(goal_json['href'])
      end
    end
  end

  def save_project_appeal(json, project)
    appeal_json = json['vyzva']
    if appeal_json.present?
      appeal = project.build_ongoing_project_appeal
      appeal[:itms_identifier] = appeal_json['id']
    end
  end
end
