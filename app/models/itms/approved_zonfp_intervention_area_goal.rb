class Itms::ApprovedZonfpInterventionAreaGoal < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_oblasti_intervencie_ciele'

  belongs_to :approved_zonfp_intervention_area
end
