class Itms::RejectedZonfpInterventionAreaGoal < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_oblasti_intervencie_ciele'

  belongs_to :rejected_zonfp_intervention_area
end
