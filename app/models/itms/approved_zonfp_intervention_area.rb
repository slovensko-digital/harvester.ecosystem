class Itms::ApprovedZonfpInterventionArea < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_oblasti_intervencie'

  belongs_to :approved_zonfp
  has_one :approved_zonfp_intervention_area_goal, foreign_key: :zonfp_schvalene_oblasti_intervencie_id, primary_key: :id
end
