class Itms::ApprovedZonfpEconomicActivity < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_hospodarske_cinnosti'

  belongs_to :approved_zonfp
  has_one :approved_zonfp_economic_activity_goal, foreign_key: :zonfp_schvalene_hospodarske_cinnosti_id, primary_key: :id
end
