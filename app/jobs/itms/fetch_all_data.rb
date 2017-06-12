class Itms::FetchAllData < ApplicationJob
  queue_as :itms

  def self.perform_all
    [
      {
        harvester: Itms::AccountingDocumentsHarvester,
        object: Itms::AccountingDocument
      },
      {
        harvester: Itms::ApprovedZonfpHarvester,
        object: Itms::ApprovedZonfp
      },
      {
        harvester: Itms::DeclaredAppealsHarvester,
        object: Itms::DeclaredAppeal
      },
      {
        harvester: Itms::FinishedProjectsHarvester,
        object: Itms::FinishedProject
      },
      {
        harvester: Itms::OngoingProjectsHarvester,
        object: Itms::OngoingProject
      },
      {
        harvester: Itms::OperationalProgramsHarvester,
        object: Itms::OperationalProgram
      },
      {
        harvester: Itms::PaidZopHarvester,
        object: Itms::PaidZop
      },
      {
        harvester: Itms::PlannedAppealsHarvester,
        object: Itms::PlannedAppeal
      },
      {
        harvester: Itms::ProcurementsHarvester,
        object: Itms::Procurement
      },
      {
        harvester: Itms::ReceivedZonfpHarvester,
        object: Itms::ReceivedZonfp
      },
      {
        harvester: Itms::RejectedZonfpHarvester,
        object: Itms::RejectedZonfp
      },
      {
        harvester: Itms::RejectedZopHarvester,
        object: Itms::RejectedZop
      },
      {
        harvester: Itms::SubmittedZopHarvester,
        object: Itms::SubmittedZop
      },
    ].each do |harvester|
      Itms::FetchAllData.perform_later(harvester[:harvester].to_s, harvester[:object].maximum(:itms_identifier).to_i)
    end
  end

  def perform(harvester_class, min_id)
    harvester_class.constantize.run(min_id: min_id)
  end
end
