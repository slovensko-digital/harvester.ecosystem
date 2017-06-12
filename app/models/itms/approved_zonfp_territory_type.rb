class Itms::ApprovedZonfpTerritoryType < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_typy_uzemia'

  belongs_to :approved_zonfp
  has_one :approved_zonfp_territory_type_goal, foreign_key: :zonfp_schvalene_typy_uzemia_id, primary_key: :id
end
