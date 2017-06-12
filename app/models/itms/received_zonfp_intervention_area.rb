class Itms::ReceivedZonfpInterventionArea < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_oblasti_intervencie'

  belongs_to :received_zonfp
  has_one :received_zonfp_intervention_area_goal, foreign_key: :zonfp_prijate_oblasti_intervencie_id, primary_key: :id
end
