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

  def find_or_create_activity_type_by_json(json, downloader)
    return if json.blank?
    unit = Itms::ActivityType.find_by(itms_id: json['id'])
    return unit if unit.present?

    Itms::SyncActivityTypeJob.perform_now(json['id'], downloader: downloader)
    Itms::ActivityType.find_by!(itms_id: json['id'])
  end

  def find_or_create_accounts_receivable_document_by_json(json, downloader)
    return if json.blank?
    unit = Itms::AccountsReceivableDocument.find_by(itms_id: json['id'])
    return unit if unit.present?

    Itms::SyncAccountsReceivableDocumentJob.perform_now(json['id'], downloader: downloader)
    Itms::AccountsReceivableDocument.find_by!(itms_id: json['id'])
  end

  def find_or_create_discrepancy_by_json(json, downloader)
    return if json.blank?
    unit = Itms::Discrepancy.find_by(itms_id: json['id'])
    return unit if unit.present?

    Itms::SyncDiscrepancyJob.perform_now(json['id'], downloader: downloader)
    Itms::Discrepancy.find_by!(itms_id: json['id'])
  end

  def find_or_create_operational_programs_by_json(json, downloader)
    return [] if json.blank?
    json.map { |j| find_or_create_operational_program_by_json(j, downloader) }
  end

  def find_or_create_operational_program_by_json(json, downloader)
    return if json.blank?
    operational_program = Itms::OperationalProgram.find_by(itms_id: json['id'])
    return operational_program if operational_program.present?

    Itms::SyncOperationalProgramJob.perform_now(json['id'], downloader: downloader)
    Itms::OperationalProgram.find_by!(itms_id: json['id'])
  end

  def find_or_create_priority_axis_by_json(json, downloader)
    return if json.blank?
    priority_axis = Itms::PriorityAxis.find_by(itms_id: json['id'])
    return priority_axis if priority_axis.present?

    Itms::SyncPriorityAxisJob.perform_now(json['id'], downloader: downloader)
    Itms::PriorityAxis.find_by!(itms_id: json['id'])
  end

  def find_or_create_specific_goal_by_json(json, downloader)
    return if json.blank?
    specific_goal = Itms::SpecificGoal.find_by(itms_id: json['id'])
    return specific_goal if specific_goal.present?

    Itms::SyncSpecificGoalJob.perform_now(json['id'], downloader: downloader)
    Itms::SpecificGoal.find_by!(itms_id: json['id'])
  end

  def find_or_create_subjects_by_json(json, downloader)
    return [] if json.blank?
    json.map { |subject_json| find_or_create_subject_by_json(subject_json, downloader) }
  end

  def find_or_create_subject_by_json(json, downloader)
    return if json.blank?
    unit = Itms::Subject.find_by(itms_id: json['id'])
    return unit if unit.present?

    Itms::SyncSubjectJob.perform_now(json['id'], downloader: downloader)
    Itms::Subject.find_by!(itms_id: json['id'])
  end

  def find_or_create_supplier_by_json(json, downloader)
    return if json.blank?
    existing_object = Itms::Supplier.find_by(itms_id: json['id'])
    return existing_object if existing_object.present?

    Itms::SyncSupplierJob.perform_now(json['href'], downloader: downloader)
    Itms::Supplier.find_by!(itms_id: json['id'])
  end
end
