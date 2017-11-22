class Itms::SyncAllJob < ItmsJob
  def perform
    Itms::SyncAllAccountingDocumentsJob.perform_later
    Itms::SyncAllAccountsReceivableDocumentsJob.perform_later
    Itms::SyncAllActivitiesJob.perform_later
    Itms::SyncAllActivityTypesJob.perform_later
    Itms::SyncAllAnnouncedProposalCallsJob.perform_later
    Itms::SyncAllBudgetItemsJob.perform_later
    Itms::SyncAllDiscrepanciesJob.perform_later
    Itms::SyncAllIntensitiesJob.perform_later
    Itms::SyncAllNrfcApplicationsJob.perform_later
    Itms::SyncAllOperationalProgramsJob.perform_later
    Itms::SyncAllPaymentClaimsJob.perform_later
    Itms::SyncAllPlannedProposalCallsJob.perform_later
    Itms::SyncAllPriorityAxesJob.perform_later
    Itms::SyncAllProcurementContractsJob.perform_later
    Itms::SyncAllProcurementsJob.perform_later
    Itms::SyncAllProjectIndicatorsJob.perform_later
    Itms::SyncAllProjectsJob.perform_later
    Itms::SyncAllSpecificGoalsJob.perform_later
    Itms::SyncAllSubjectsJob.perform_later
    Itms::SyncAllSuppliersJob.perform_later
  end
end
