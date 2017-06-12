class Itms::ApprovedZonfpTerritoryTypeGoal < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_typy_uzemia_ciele'

  belongs_to :approved_zonfp_territory_type
end
