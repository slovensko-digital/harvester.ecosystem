require 'harvester_utils/downloader'

class Itms::ApprovedZonfpHarvester < Itms::Harvester

  def run
    json_response = load_and_parse_endpoint("https://opendata.itms2014.sk/v1/zonfp/schvalene?minId=#{min_id}&limit=100")

    json_response.each do |json|
      Itms::ApprovedZonfp.transaction do
        begin
          zonfp = Itms::ApprovedZonfp.new
          zonfp[:itms_identifier] = json['id']
          zonfp[:akronym] = json['akronym']
          zonfp[:kod] = json['kod']
          zonfp[:nazov] = json['nazov']
          zonfp[:updated_at] = json['updatedAt']
          zonfp[:created_at] = json['createdAt']
          zonfp[:popis_projektu] = json['popisProjektu']
          zonfp[:zameranie_projektu] = json['zameranieProjektu']
          zonfp[:datum_schvalenia] = json['datumSchvalenia']
          zonfp[:datum_schvaleny_konca_hlavnych_aktivit] = json['datumSchvalenyKoncaHlavnychAktivit']
          zonfp[:datum_schvaleny_konca_realizacie] = json['datumSchvalenyKoncaRealizacie']
          zonfp[:datum_schvaleny_zaciatku_hlavnych_aktivit] = json['datumSchvalenyZaciatkuHlavnychAktivit']
          zonfp[:datum_schvaleny_zaciatku_realizacie] = json['datumSchvalenyZaciatkuRealizacie']
          zonfp[:percento_schvalene_spolufinancovania] = json['percentoSchvaleneSpolufinancovania']
          zonfp[:pocet_bodov_hodnotenia_celkovy] = json['pocetBodovHodnoteniaCelkovy']
          zonfp[:suma_schvalena_celkova] = json['sumaSchvalenaCelkova']
          zonfp[:suma_schvalena_celkova_projektov_generujucich_prijem] = json['sumaSchvalenaCelkovaProjektovGenerujucichPrijem']
          zonfp[:suma_schvalena_nfp] = json['sumaSchvalenaNFP']
          zonfp[:suma_schvalena_vlastnych_zdrojov] = json['sumaSchvalenaVlastnychZdrojov']

          save_zonfp_activity_projects(json, zonfp)
          save_zonfp_financing_forms(json, zonfp)
          save_zonfp_economic_activities(json, zonfp)
          save_zonfp_measurable_indicators(json, zonfp)
          save_zonfp_realization_places(json, zonfp)
          save_zonfp_intervention_areas(json, zonfp)
          save_zonfp_organizational_components(json, zonfp)
          save_zonfp_partners(json, zonfp)
          save_zonfp_territory_types(json, zonfp)
          save_zonfp_territorial_mechanisms(json, zonfp)
          save_zonfp_appeal(json, zonfp)
          save_zonfp_applicant(json, zonfp)
          save_zonfp_evaluators(json, zonfp)

          zonfp.save!
        rescue ActiveRecord::RecordNotUnique
          Rails.logger.debug("#{zonfp.class} #{json['id']} has been already stored")
          raise ActiveRecord::Rollback
        end
      end
    end

    rerun_if_necessary(json_response, Itms::ApprovedZonfp)
  end

  private

  def save_zonfp_activity_projects(json, zonfp)
    Array(json['aktivityProjekt']).each do |project_json|
      project = zonfp.approved_zonfp_activity_projects.new
      project[:datum_konca_planovany] = project_json['id']
      project[:datum_konca_planovany] = project_json['datumKoncaPlanovany']
      project[:datum_konca_skutocny] = project_json['datumKoncaSkutocny']
      project[:datum_zaciatku_planovany] = project_json['datumZaciatkuPlanovany']
      project[:datum_zaciatku_skutocny] = project_json['datumZaciatkuSkutocny']
      project[:kod] = project_json['kod']
      project[:nazov] = project_json['nazov']

      unit_json = project_json['subjekt']
      if unit_json.present?
        unit = project.build_approved_zonfp_activity_project_unit
        unit[:itms_identifier] = unit_json['id']
        unit[:ico] = unit_json['ico']
        unit[:dic] = unit_json['dic']
        unit[:ine_identifikacne_cislo] = unit_json['ineIdentifikacneCislo']
        load_and_save_unit(unit_json['href'])
      end
    end
  end

  def save_zonfp_financing_forms(json, zonfp)
    Array(json['formyFinancovania']).each do |form_json|
      form = zonfp.approved_zonfp_financing_forms.new
      form[:itms_identifier] = form_json['id']
      form[:kod_zdroj] = form_json['kodZdroj']
      form[:nazov] = form_json['nazov']

      goal_json = form_json['konkretnyCiel']
      if goal_json.present?
        goal = form.build_approved_zonfp_financing_form_goal
        goal[:itms_identifier] = goal_json['id']
        load_and_save_specific_goal(goal_json['href'])
      end
    end
  end

  def save_zonfp_economic_activities(json, zonfp)
    Array(json['hospodarskeCinnosti']).each do |activity_json|
      activity = zonfp.approved_zonfp_economic_activities.new
      activity[:itms_identifier] = activity_json['id']
      activity[:kod_zdroj] = activity_json['kodZdroj']
      activity[:nazov] = activity_json['nazov']

      goal_json = activity_json['konkretnyCiel']
      if goal_json.present?
        goal = activity.build_approved_zonfp_economic_activity_goal
        goal[:itms_identifier] = goal_json['id']
        load_and_save_specific_goal(goal_json['href'])
      end
    end
  end

  def save_zonfp_measurable_indicators(json, zonfp)
    Array(json['meratelneUkazovatele']).each do |indicator_json|
      indicator = zonfp.approved_zonfp_measurable_indicators.new
      indicator[:aktualny_skutocny_stav] = indicator_json['aktualnySkutocnyStav']
      indicator[:hodnota_cielova_celkova] = indicator_json['hodnotaCielovaCelkova']
      indicator[:kod] = indicator_json['kod']
      indicator[:merna_jednotka] = indicator_json['mernaJednotka']
      indicator[:nazov] = indicator_json['nazov']
    end
  end

  def save_zonfp_realization_places(json, zonfp)
    Array(json['miestaRealizacie']).each do |place_json|
      place = zonfp.approved_zonfp_realization_places.new
      %w(nuts3 nuts4 nuts5 stat).each do |type|
        unit_json = place_json[type]
        next if unit_json.blank?
        unit = place.approved_zonfp_realization_place_units.new(typ: type)
        unit[:itms_identifier] = unit_json['id']
        unit[:nazov] = unit_json['nazov']
      end
    end
  end

  def save_zonfp_intervention_areas(json, zonfp)
    Array(json['oblastiIntervencie']).each do |area_json|
      area = zonfp.approved_zonfp_intervention_areas.new
      area[:itms_identifier] = area_json['id']
      area[:kod_zdroj] = area_json['kodZdroj']
      area[:nazov] = area_json['nazov']

      goal_json = area_json['konkretnyCiel']
      if goal_json.present?
        goal = area.build_approved_zonfp_intervention_area_goal
        goal[:itms_identifier] = goal_json['id']
        load_and_save_specific_goal(goal_json['href'])
      end
    end
  end

  def save_zonfp_organizational_components(json, zonfp)
    Array(json['organizacneZlozky']).each do |component_json|
      component = zonfp.approved_zonfp_organizational_components.new
      component[:itms_identifier] = component_json['id']
      component[:adresa] = component_json['adresa']
      component[:nazov] = component_json['nazov']
    end
  end

  def save_zonfp_partners(json, zonfp)
    Array(json['partneri']).each do |partner_json|
      partner = zonfp.approved_zonfp_partners.new
      partner[:itms_identifier] = partner_json['id']
      partner[:ico] = partner_json['ico']
      partner[:dic] = partner_json['dic']
      partner[:ine_identifikacne_cislo] = partner_json['ineIdentifikacneCislo']
    end
  end

  def save_zonfp_territory_types(json, zonfp)
    Array(json['typyUzemia']).each do |territory_type_json|
      territory_type = zonfp.approved_zonfp_territory_types.new
      territory_type[:itms_identifier] = territory_type_json['id']
      territory_type[:kod_zdroj] = territory_type_json['kodZdroj']
      territory_type[:nazov] = territory_type_json['nazov']

      goal_json = territory_type_json['konkretnyCiel']
      if goal_json.present?
        goal = territory_type.build_approved_zonfp_territory_type_goal
        goal[:itms_identifier] = goal_json['id']
        load_and_save_specific_goal(goal_json['href'])
      end
    end
  end

  def save_zonfp_territorial_mechanisms(json, zonfp)
    Array(json['uzemneMechanizmy']).each do |mechanism_json|
      mechanism = zonfp.approved_zonfp_territorial_mechanisms.new
      mechanism[:itms_identifier] = mechanism_json['id']
      mechanism[:kod_zdroj] = mechanism_json['kodZdroj']
      mechanism[:nazov] = mechanism_json['nazov']

      goal_json = mechanism_json['konkretnyCiel']
      if goal_json.present?
        goal = mechanism.build_approved_zonfp_territorial_mechanism_goal
        goal[:itms_identifier] = goal_json['id']
        load_and_save_specific_goal(goal_json['href'])
      end
    end
  end

  def save_zonfp_appeal(json, zonfp)
    appeal_json = json['vyzva']
    if appeal_json.present?
      appeal = zonfp.build_approved_zonfp_appeal
      appeal[:itms_identifier] = appeal_json['id']
    end
  end

  def save_zonfp_applicant(json, zonfp)
    applicant_json = json['ziadatel']
    if applicant_json.present?
      applicant = zonfp.build_approved_zonfp_applicant
      applicant[:itms_identifier] = applicant_json['id']
      applicant[:ico] = applicant_json['ico']
      applicant[:dic] = applicant_json['dic']
      applicant[:ine_identifikacne_cislo] = applicant_json['ineIdentifikacneCislo']
    end
  end

  def save_zonfp_evaluators(json, zonfp)
    Array(json['hodnotitelia']).each do |evaluator_json|
      evaluator = zonfp.approved_zonfp_evaluators.new
      evaluator[:itms_identifier] = evaluator_json['id']
      evaluator[:email] = evaluator_json['email']
      evaluator[:meno] = evaluator_json['meno']
      evaluator[:meno_uplne] = evaluator_json['menoUplne']
      evaluator[:priezvisko] = evaluator_json['priezvisko']
      evaluator[:telefon] = evaluator_json['telefon']
    end
  end
end
