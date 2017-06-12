class Itms::OngoingProjectInterventionArea < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_oblasti_intervencie'

  belongs_to :ongoing_project
  has_one :ongoing_project_intervention_area_goal, foreign_key: :projekty_vrealizacii_oblasti_intervencie_id, primary_key: :id
end
