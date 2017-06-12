class Itms::RejectedZonfpInterventionArea < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_oblasti_intervencie'

  belongs_to :rejected_zonfp
  has_one :rejected_zonfp_intervention_area_goal, foreign_key: :zonfp_zamietnute_oblasti_intervencie_id, primary_key: :id
end
