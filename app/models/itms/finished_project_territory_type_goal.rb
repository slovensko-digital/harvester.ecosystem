class Itms::FinishedProjectTerritoryTypeGoal < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_typy_uzemia_ciele'

  belongs_to :finished_project_territory_type
end
