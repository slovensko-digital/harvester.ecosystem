class Itms::OngoingProjectInterventionAreaGoal < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_oblasti_intervencie_ciele'

  belongs_to :ongoing_project_intervention_area
end
