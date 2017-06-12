class Itms::FinishedProjectTerritoryType < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_typy_uzemia'

  belongs_to :finished_project
  has_one :finished_project_territory_type_goal, foreign_key: :projekty_ukoncene_typy_uzemia_id, primary_key: :id
end
