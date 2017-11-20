class ItmsJob < ApplicationJob
  def find_or_create_codelist_value_by_json(json, downloader)
    return if json.blank?
    codelist_value = Itms::CodelistValue.where_codelist_and_value(json['ciselnikKod'], json['id']).first
    return codelist_value if codelist_value.present?

    Itms::SyncCodelistValueJob.perform_now(json['ciselnikKod'], json['id'], downloader: downloader)
    Itms::CodelistValue.where_codelist_and_value(json['ciselnikKod'], json['id']).first!
  end

  def find_or_create_codelist_values_by_json(json, downloader)
    return [] if json.blank?
    json.map { |codelist_value_json| find_or_create_codelist_value_by_json(codelist_value_json, downloader) }
  end

  def find_or_create_activity_by_json(json, downloader)
    return if json.blank?
    existing_object = Itms::Activity.find_by(itms_id: json['id'])
    return existing_object if existing_object.present?

    Itms::SyncActivityJob.perform_now(json['href'], downloader: downloader)
    Itms::Activity.find_by!(itms_id: json['id'])
  end

  def find_or_create_activity_type_by_json(json, downloader)
    return if json.blank?
    unit = Itms::ActivityType.find_by(itms_id: json['id'])
    return unit if unit.present?

    Itms::SyncActivityTypeJob.perform_now(json['id'], downloader: downloader)
    Itms::ActivityType.find_by!(itms_id: json['id'])
  end

  def find_or_create_accounting_documents_by_json(json, downloader)
    return [] if json.blank?
    json.map { |j| find_or_create_accounting_document_by_json(j, downloader) }
  end

  def find_or_create_accounting_document_by_json(json, downloader)
    return if json.blank?
    existing_object = Itms::AccountingDocument.find_by(itms_id: json['id'])
    return existing_object if existing_object.present?

    Itms::SyncAccountingDocumentJob.perform_now(json['href'], downloader: downloader)
    Itms::AccountingDocument.find_by!(itms_id: json['id'])
  end

  def find_or_create_accounts_receivable_document_by_json(json, downloader)
    return if json.blank?
    unit = Itms::AccountsReceivableDocument.find_by(itms_id: json['id'])
    return unit if unit.present?

    Itms::SyncAccountsReceivableDocumentJob.perform_now(json['id'], downloader: downloader)
    Itms::AccountsReceivableDocument.find_by!(itms_id: json['id'])
  end

  def find_or_create_announced_proposal_call_by_json(json, downloader)
    return if json.blank?
    existing_object = Itms::AnnouncedProposalCall.find_by(itms_id: json['id'])
    return existing_object if existing_object.present?

    Itms::SyncAnnouncedProposalCallJob.perform_now(json['href'], downloader: downloader)
    Itms::AnnouncedProposalCall.find_by!(itms_id: json['id'])
  end

  def find_or_create_budget_items_by_json(json, downloader)
    return [] if json.blank?
    json.map { |j| find_or_create_budget_item_by_json(j, downloader) }
  end

  def find_or_create_budget_item_by_json(json, downloader)
    return if json.blank?
    existing_object = Itms::BudgetItem.find_by(itms_id: json['id'])
    return existing_object if existing_object.present?

    Itms::SyncBudgetItemJob.perform_now(json['href'], downloader: downloader)
    Itms::BudgetItem.find_by!(itms_id: json['id'])
  end

  def find_or_create_discrepancy_by_json(json, downloader)
    return if json.blank?
    unit = Itms::Discrepancy.find_by(itms_id: json['id'])
    return unit if unit.present?

    Itms::SyncDiscrepancyJob.perform_now(json['href'], downloader: downloader)
    Itms::Discrepancy.find_by!(itms_id: json['id'])
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

  def find_or_create_intensity_by_json(json, downloader)
    return if json.blank?
    intensity = Itms::Intensity.find_by(itms_id: json['id'])
    return intensity if intensity.present?

    Itms::SyncIntensityJob.perform_now(json['href'], downloader: downloader)
    Itms::Intensity.find_by!(itms_id: json['id'])
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

  def find_or_create_operational_programs_by_json(json_list, downloader)
    return [] if json_list.blank?
    json_list.map { |json| find_or_create_operational_program_by_json(json, downloader) }.uniq
  end

  def find_or_create_operational_program_by_json(json, downloader)
    return if json.blank?
    operational_program = Itms::OperationalProgram.find_by(itms_id: json['id'])
    return operational_program if operational_program.present?

    Itms::SyncOperationalProgramJob.perform_now(json['id'], downloader: downloader)
    Itms::OperationalProgram.find_by!(itms_id: json['id'])
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

  def find_or_create_payment_claims_by_json(json_list, downloader)
    return [] if json_list.blank?
    json_list.map { |json| find_or_create_payment_claim_by_json(json, downloader) }
  end

  def find_or_create_payment_claim_by_json(json, downloader)
    return if json.blank?
    existing_object = Itms::PaymentClaim.find_by(itms_id: json['id'])
    return existing_object if existing_object.present?

    Itms::SyncPaymentClaimJob.perform_now(json['href'], downloader: downloader)
    Itms::PaymentClaim.find_by!(itms_id: json['id'])
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

  def find_or_create_priority_axis_by_json(json, downloader)
    return if json.blank?
    priority_axis = Itms::PriorityAxis.find_by(itms_id: json['id'])
    return priority_axis if priority_axis.present?

    Itms::SyncPriorityAxisJob.perform_now(json['id'], downloader: downloader)
    Itms::PriorityAxis.find_by!(itms_id: json['id'])
  end

  def find_or_create_procurements_by_json(json_list, downloader)
    return [] if json_list.blank?
    json_list.map { |json| find_or_create_procurement_by_json(json, downloader) }.uniq
  end

  def find_or_create_procurement_by_json(json, downloader)
    return if json.blank?
    existing_object = Itms::Procurement.find_by(itms_id: json['id'])
    return existing_object if existing_object.present?

    Itms::SyncProcurementJob.perform_now(json['href'], downloader: downloader)
    Itms::Procurement.find_by!(itms_id: json['id'])
  end

  def find_or_create_project_by_json(json, downloader)
    return if json.blank?
    existing_object = Itms::Project.find_by(itms_id: json['id'])
    return existing_object if existing_object.present?

    Itms::SyncProjectJob.perform_now(json['href'], downloader: downloader)
    Itms::Project.find_by!(itms_id: json['id'])
  end

  def find_or_create_project_indicator_by_json(json, downloader)
    return if json.blank?
    existing_object = Itms::ProjectIndicator.find_by(itms_id: json['id'])
    return existing_object if existing_object.present?

    Itms::SyncProjectIndicatorJob.perform_now(json['href'], downloader: downloader)
    Itms::ProjectIndicator.find_by!(itms_id: json['id'])
  end

  def find_or_create_specific_goals_by_json(json, downloader)
    return [] if json.blank?
    json.map { |j| find_or_create_specific_goal_by_json(j, downloader) }
  end

  def find_or_create_specific_goal_by_json(json, downloader)
    return if json.blank?
    specific_goal = Itms::SpecificGoal.find_by(itms_id: json['id'])
    return specific_goal if specific_goal.present?

    Itms::SyncSpecificGoalJob.perform_now(json['id'], downloader: downloader)
    Itms::SpecificGoal.find_by!(itms_id: json['id'])
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

  def find_or_create_subjects_by_json(json, downloader)
    return [] if json.blank?
    json.map { |subject_json| find_or_create_subject_by_json(subject_json, downloader) }
  end

  def find_or_create_subject_by_json(json, downloader)
    return if json.blank?
    unit = Itms::Subject.find_by(itms_id: json['id'])
    return unit if unit.present?

    Itms::SyncSubjectJob.perform_now(json['href'], downloader: downloader)
    Itms::Subject.find_by!(itms_id: json['id'])
  end

  def find_or_create_supplier_by_json(json, downloader)
    return if json.blank?
    existing_object = Itms::Supplier.find_by(itms_id: json['id'])
    return existing_object if existing_object.present?

    Itms::SyncSupplierJob.perform_now(json['href'], downloader: downloader)
    Itms::Supplier.find_by!(itms_id: json['id'])
  end

  def find_or_create_additional_info_by_json(json, scope)
    return [] if json.blank?
    json.map do |j|
      scope.find_or_create_by!(nazov: j['nazov'], url: j['url'])
    end
  end
end
