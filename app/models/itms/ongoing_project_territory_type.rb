class Itms::OngoingProjectTerritoryType < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_typy_uzemia'

  belongs_to :ongoing_project
  has_one :ongoing_project_territory_type_goal, foreign_key: :projekty_vrealizacii_typy_uzemia_id, primary_key: :id
end
