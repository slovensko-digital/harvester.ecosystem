class Itms::ProjectTerritoryType < ApplicationRecord
  include Itms::ProjectGoalCodelist

  self.table_name = 'itms.projekty_typy_uzemia'
end
