class Itms::RejectedZonfpTerritoryType < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_typy_uzemia'

  belongs_to :rejected_zonfp
  has_one :rejected_zonfp_territory_type_goal, foreign_key: :zonfp_zamietnute_typy_uzemia_id, primary_key: :id
end
