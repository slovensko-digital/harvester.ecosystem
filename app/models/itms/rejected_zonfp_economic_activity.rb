class Itms::RejectedZonfpEconomicActivity < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_hospodarske_cinnosti'

  belongs_to :rejected_zonfp
  has_one :rejected_zonfp_economic_activity_goal, foreign_key: :zonfp_zamietnute_hospodarske_cinnosti_id, primary_key: :id
end
