require 'rails_helper'

RSpec.describe ItmsJob, type: :job do
  it 'defines find_or_create_XYZ_by_json methods' do
    expect(subject).to respond_to(
      :find_or_create_activity_by_json,
      :find_or_create_activities_by_json,

      :find_or_create_activity_type_by_json,
      :find_or_create_activity_types_by_json,

      :find_or_create_accounting_document_by_json,
      :find_or_create_accounting_documents_by_json,

      :find_or_create_accounts_receivable_document_by_json,
      :find_or_create_accounts_receivable_documents_by_json,

      :find_or_create_announced_proposal_call_by_json,
      :find_or_create_announced_proposal_calls_by_json,

      :find_or_create_budget_items_by_json,
      :find_or_create_budget_item_by_json,

      :find_or_create_codelist_value_by_json,
      :find_or_create_codelist_values_by_json,

      :find_or_create_intensity_by_json,
      :find_or_create_intensities_by_json,

      :find_or_create_nrfc_application_by_json,
      :find_or_create_nrfc_applications_by_json,

      :find_or_create_operational_program_by_json,
      :find_or_create_operational_programs_by_json,

      :find_or_create_payment_claim_by_json,
      :find_or_create_payment_claims_by_json,

      :find_or_create_priority_axis_by_json,
      :find_or_create_priority_axes_by_json,

      :find_or_create_procurement_by_json,
      :find_or_create_procurements_by_json,

      :find_or_create_project_by_json,
      :find_or_create_projects_by_json,

      :find_or_create_project_indicator_by_json,
      :find_or_create_project_indicators_by_json,

      :find_or_create_specific_goal_by_json,
      :find_or_create_specific_goals_by_json,

      :find_or_create_subject_by_json,
      :find_or_create_subjects_by_json,

      :find_or_create_supplier_by_json,
      :find_or_create_suppliers_by_json,
    )
  end
end
