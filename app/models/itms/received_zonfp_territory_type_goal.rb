class Itms::ReceivedZonfpTerritoryTypeGoal < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_typy_uzemia_ciele'

  belongs_to :received_zonfp_territory_type
end
