class Itms::ProjectTerritoryType < ApplicationRecord
  self.table_name = 'itms.projekty_typy_uzemia'

  belongs_to :projekt, class_name: Itms::Project
  belongs_to :konkretny_ciel, class_name: Itms::SpecificGoal
end
