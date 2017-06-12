class Itms::ApprovedZonfpEconomicActivityGoal < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_hospodarske_cinnosti_ciele'

  belongs_to :approved_zonfp_economic_activity
end
