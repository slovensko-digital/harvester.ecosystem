class Itms::FinishedProjectInterventionAreaGoal < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_oblasti_intervencie_ciele'

  belongs_to :finished_project_intervention_area
end
