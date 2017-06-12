class Itms::FinishedProjectInterventionArea < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_oblasti_intervencie'

  belongs_to :finished_project
  has_one :finished_project_intervention_area_goal, foreign_key: :projekty_ukoncene_oblasti_intervencie_id, primary_key: :id
end
