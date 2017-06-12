class Itms::ReceivedZonfpTerritoryType < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_typy_uzemia'

  belongs_to :received_zonfp
  has_one :received_zonfp_territory_type_goal, foreign_key: :zonfp_prijate_typy_uzemia_id, primary_key: :id
end
