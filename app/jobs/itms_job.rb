class ItmsJob < ApplicationJob

  [
      Itms::Activity,
      Itms::ActivityType,
      Itms::AccountingDocument,
      Itms::AccountsReceivableDocument,
      Itms::AnnouncedProposalCall,
      Itms::BudgetItem,
      Itms::CodelistValue,
      Itms::Discrepancy,
      Itms::Intensity,
      Itms::NrfcApplication,
      Itms::OperationalProgram,
      Itms::PaymentClaim,
      Itms::PriorityAxis,
      Itms::Procurement,
      Itms::Project,
      Itms::ProjectIndicator,
      Itms::SpecificGoal,
      Itms::Subject,
      Itms::Supplier,

  ].each do |model_class|
    base_name = model_class.name.split('::').last

    find_or_create_item_by_json = "find_or_create_#{base_name.underscore}_by_json"
    find_or_create_list_by_json = "find_or_create_#{base_name.pluralize.underscore}_by_json"

    define_method find_or_create_item_by_json do |json, downloader|
      return if json.blank?
      existing_object = model_class.find_by(itms_id: json['id'])
      return existing_object if existing_object.present?

      sync_job_class = "Itms::Sync#{base_name}Job".constantize
      sync_job_class.perform_now(json['href'], downloader: downloader)
      model_class.find_by!(itms_id: json['id'])
    end

    define_method find_or_create_list_by_json do |json_list, downloader|
      return [] if json_list.blank?
      json_list.map { |json| public_send(find_or_create_item_by_json, json, downloader) }.uniq
    end
  end

  def find_or_create_codelist_value_by_json(json, downloader)
    return if json.blank?
    codelist_value = Itms::CodelistValue.where_codelist_and_value(json['ciselnikKod'], json['id']).first
    return codelist_value if codelist_value.present?

    Itms::SyncCodelistValueJob.perform_now(json['ciselnikKod'], json['id'], downloader: downloader)
    Itms::CodelistValue.where_codelist_and_value(json['ciselnikKod'], json['id']).first!
  end

  def find_or_create_implementation_places_by_json(json, downloader)
    return [] if json.blank?
    json.map do |j|
      Itms::ImplementationPlace.find_or_create_by(
          nuts_3: find_or_create_nuts_code_by_json(j['nuts3'], downloader),
          nuts_4: find_or_create_nuts_code_by_json(j['nuts4'], downloader),
          nuts_5: find_or_create_nuts_code_by_json(j['nuts5'], downloader),
          stat: find_or_create_codelist_value_by_json(j['stat'], downloader)
      )
    end
  end

  def find_or_create_measurable_indicators_by_json(json_list, scope, downloader)
    return [] if json_list.blank?

    json_list.map do |json|
      project_indicator = find_or_create_project_indicator_by_json(json['projektovyUkazovatel'], downloader)
      mi = scope.find_or_initialize_by(projektovy_ukazovatel: project_indicator)
      mi.aktualny_skutocny_stav = json['aktualnySkutocnyStav'] ? json['aktualnySkutocnyStav'].to_d : nil
      mi.datum_posledneho_merania = json['datumPoslednehoMerania']
      mi.hodnota_cielova_celkova = json['hodnotaCielovaCelkova'] ? json['hodnotaCielovaCelkova'].to_d : nil
      mi.priznak_rizika = json['priznakRizika']
      mi.save!

      mi
    end
  end

  def find_or_create_nuts_code_by_json(json, downloader)
    return if json.blank?
    Itms::NutsCode.find_or_create_by!(
        gps_lat: json['gpsLat'] ? json['gpsLat'].to_d : nil,
        gps_lon: json['gpsLon'] ? json['gpsLon'].to_d : nil,
        hodnota_nuts: find_or_create_codelist_value_by_json(json['hodnotaNuts'], downloader)
    )
  end

  def find_or_create_organisational_units_by_json(json)
    return [] if json.blank?

    json.map do |j|
      unit = Itms::OrganisationalUnit.find_or_create_by!(itms_id: j['id'])
      unit.adresa = j['adresa']
      unit.nazov = j['nazov']
      unit.save!
      unit
    end
  end

  def find_or_create_persons_by_json(json_list)
    return [] if json_list.blank?

    json_list.map do |json|
      p = Itms::Person.find_or_initialize_by(itms_id: json['id'])
      p.email = json['email']
      p.meno = json['meno']
      p.meno_uplne = json['menoUplne']
      p.priezvisko = json['priezvisko']
      p.telefon = json['telefon']
      p.save!

      p
    end
  end

  def find_or_create_specific_goals_with_codelist_values_by_json(json_list, downloader)
    return [] if json_list.blank?
    json_list.map { |json| find_or_create_specific_goal_with_codelist_value_by_json(json, downloader) }
  end

  def find_or_create_specific_goal_with_codelist_value_by_json(json, downloader)
    return if json.blank?
    existing_object = Itms::SpecificGoalCodelistValue.where_goal_and_codelist(
        json['konkretnyCiel']['id'],
        json['hodnotaCiselnika']['ciselnikKod'],
        json['hodnotaCiselnika']['id'],
    ).first
    return existing_object if existing_object.present?

    codelist_value = find_or_create_codelist_value_by_json(json['hodnotaCiselnika'], downloader)
    specific_goal = find_or_create_specific_goal_by_json(json['konkretnyCiel'], downloader)
    Itms::SpecificGoalCodelistValue.find_or_create_by!(hodnota_ciselnika: codelist_value, konkretny_ciel: specific_goal)
  end

  def find_or_create_additional_info_by_json(json, scope)
    return [] if json.blank?
    json.map do |j|
      scope.find_or_create_by!(nazov: j['nazov'], url: j['url'])
    end
  end
end
