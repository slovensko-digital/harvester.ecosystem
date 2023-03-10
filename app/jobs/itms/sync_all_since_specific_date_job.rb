class Itms::SyncAllSinceSpecificDateJob < ItmsJob
  def perform(modified_since)
    Itms::SyncAllAccountingDocumentsJob.perform_later(modified_since: modified_since.to_i)
    Itms::SyncAllAccountsReceivableDocumentsJob.perform_later(modified_since: modified_since.to_i)
    Itms::SyncAllActivitiesJob.perform_later(modified_since: modified_since.to_i)
    Itms::SyncAllActivityTypesJob.perform_later(modified_since: modified_since.to_i)
    Itms::SyncAllAnnouncedProposalCallsJob.perform_later(modified_since: modified_since.to_i)
    Itms::SyncAllBudgetItemsJob.perform_later
    Itms::SyncAllCodelistsJob.perform_later
    Itms::SyncAllCodelistValuesJob.perform_later
    Itms::SyncAllDiscrepanciesJob.perform_later(modified_since: modified_since.to_i)
    Itms::SyncAllIntensitiesJob.perform_later
    Itms::SyncAllNrfcApplicationsJob.perform_later(modified_since: modified_since.to_i)
    Itms::SyncAllOperationalProgramsJob.perform_later(modified_since: modified_since.to_i)
    Itms::SyncAllPaymentClaimsJob.perform_later(modified_since: modified_since.to_i)
    Itms::SyncAllPlannedProposalCallsJob.perform_later(modified_since: modified_since.to_i)
    Itms::SyncAllPriorityAxesJob.perform_later
    Itms::SyncAllProcurementContractsJob.perform_later(modified_since: modified_since.to_i)
    Itms::SyncAllProcurementsJob.perform_later(modified_since: modified_since.to_i)
    Itms::SyncAllProjectIndicatorsJob.perform_later(modified_since: modified_since.to_i)
    Itms::SyncAllProjectsJob.perform_later(modified_since: modified_since.to_i)
    Itms::SyncAllSpecificGoalsJob.perform_later
    Itms::SyncAllSubjectsJob.perform_later
    Itms::SyncAllSuppliersJob.perform_later
  end
end
