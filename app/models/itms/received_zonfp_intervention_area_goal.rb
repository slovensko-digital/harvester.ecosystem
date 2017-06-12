class Itms::ReceivedZonfpInterventionAreaGoal < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_oblasti_intervencie_ciele'

  belongs_to :received_zonfp_intervention_area
end
