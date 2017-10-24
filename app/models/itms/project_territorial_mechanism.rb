class Itms::ProjectTerritorialMechanism < ApplicationRecord
  self.table_name = 'itms.projekty_uzemne_mechanizmy'

  belongs_to :uzemny_mechanizmus, class_name: Itms::CodeSpecificGoal
end
