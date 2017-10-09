class ItmsJob < ApplicationJob
  def find_or_create_code_by_json(json)
    Itms::Code.find_or_create_by!(
        kod_id: json['id'],
        kod_zdroj: json['kodZdroj'],
        nazov: json['nazov']
    )
  end

  def find_or_create_codes_by_json(json)
    return [] if json.blank?
    json.map { |code_json| find_or_create_code_by_json(code_json) }
  end

  def find_or_create_accounts_receivable_document_by_json(json, downloader)
    unit = Itms::AccountsReceivableDocument.find_by(itms_id: json['id'])
    return unit if unit.present?

    Itms::SyncAccountsReceivableDocumentJob.perform_now(json['id'], downloader: downloader)
    Itms::AccountsReceivableDocument.find_by!(itms_id: json['id'])
  end

  def find_or_create_discrepancy_by_json(json, downloader)
    unit = Itms::Discrepancy.find_by(itms_id: json['id'])
    return unit if unit.present?

    Itms::SyncDiscrepancyJob.perform_now(json['id'], downloader: downloader)
    Itms::Discrepancy.find_by!(itms_id: json['id'])
  end

  def find_or_create_specific_goal_by_json(json, downloader)
    specific_goal = Itms::SpecificGoal.find_by(itms_id: json['id'])
    return specific_goal if specific_goal.present?

    Itms::SyncSpecificGoalJob.perform_now(json['id'], downloader: downloader)
    Itms::SpecificGoal.find_by!(itms_id: json['id'])
  end

  def find_or_create_subject_by_json(json, downloader)
    unit = Itms::Subject.find_by(itms_id: json['id'])
    return unit if unit.present?

    Itms::SyncSubjectJob.perform_now(json['id'], downloader: downloader)
    Itms::Subject.find_by!(itms_id: json['id'])
  end
end
