class Itms::ReceivedZonfpEconomicActivity < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_hospodarske_cinnosti'

  belongs_to :received_zonfp
  has_one :received_zonfp_economic_activity_goal, foreign_key: :zonfp_prijate_hospodarske_cinnosti_id, primary_key: :id
end
