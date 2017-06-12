class Itms::OngoingProjectTerritoryTypeGoal < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_typy_uzemia_ciele'

  belongs_to :ongoing_project_territory_type
end
