class Itms::RejectedZonfpEconomicActivityGoal < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_hospodarske_cinnosti_ciele'

  belongs_to :rejected_zonfp_economic_activity
end
