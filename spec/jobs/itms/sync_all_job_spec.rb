require 'rails_helper'

RSpec.describe Itms::SyncAllJob, type: :job do
  let(:downloader) { double(:downloader) }

  describe '#perform' do
    ActiveJob::Base.queue_adapter = :test

    it 'runs all SyncAll jobs' do
      subject.perform

      expect(Itms::SyncAllAccountingDocumentsJob).to have_been_enqueued
      expect(Itms::SyncAllAccountsReceivableDocumentsJob).to have_been_enqueued
      expect(Itms::SyncAllActivitiesJob).to have_been_enqueued
      expect(Itms::SyncAllActivityTypesJob).to have_been_enqueued
      expect(Itms::SyncAllAnnouncedProposalCallsJob).to have_been_enqueued
      expect(Itms::SyncAllBudgetItemsJob).to have_been_enqueued
      expect(Itms::SyncAllDiscrepanciesJob).to have_been_enqueued
      expect(Itms::SyncAllIntensitiesJob).to have_been_enqueued
      expect(Itms::SyncAllNrfcApplicationsJob).to have_been_enqueued
      expect(Itms::SyncAllOperationalProgramsJob).to have_been_enqueued
      expect(Itms::SyncAllPaymentClaimsJob).to have_been_enqueued
      expect(Itms::SyncAllPlannedProposalCallsJob).to have_been_enqueued
      expect(Itms::SyncAllPriorityAxesJob).to have_been_enqueued
      expect(Itms::SyncAllProcurementContractsJob).to have_been_enqueued
      expect(Itms::SyncAllProcurementsJob).to have_been_enqueued
      expect(Itms::SyncAllProjectIndicatorsJob).to have_been_enqueued
      expect(Itms::SyncAllProjectsJob).to have_been_enqueued
      expect(Itms::SyncAllSpecificGoalsJob).to have_been_enqueued
      expect(Itms::SyncAllSubjectsJob).to have_been_enqueued
      expect(Itms::SyncAllSuppliersJob).to have_been_enqueued
    end
  end
end
