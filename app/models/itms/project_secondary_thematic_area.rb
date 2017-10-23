class Itms::ProjectSecondaryThematicArea < ApplicationRecord
  self.table_name = 'itms.projekty_sekundarne_tematicke_okruhy'

  belongs_to :sekundarny_tematicky_okruh, class_name: Itms::SpecificGoalCode
end
