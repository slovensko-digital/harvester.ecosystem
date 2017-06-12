class Itms::RejectedZonfpTerritoryTypeGoal < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_typy_uzemia_ciele'

  belongs_to :rejected_zonfp_territory_type
end
