class Itms::ReceivedZonfpEconomicActivityGoal < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_hospodarske_cinnosti_ciele'

  belongs_to :received_zonfp_economic_activity
end
