class Itms::ProjectTerritoryType < ApplicationRecord
  self.table_name = 'itms.projekty_typy_uzemia'

  belongs_to :typ_uzemia, class_name: Itms::CodeSpecificGoal
end
