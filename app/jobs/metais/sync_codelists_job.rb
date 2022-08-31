class Metais::SyncCodelistsJob < ApplicationJob
  queue_as :metais

  def perform
    Metais::SyncCodelistProgramJob.perform_later
    Metais::SyncCodelistInvestmentTypeJob.perform_later
    Metais::SyncCodelistProjectStateJob.perform_later
    Metais::SyncCodelistProjectPhaseJob.perform_later
    Metais::SyncCodelistSourceJob.perform_later
  end
end
