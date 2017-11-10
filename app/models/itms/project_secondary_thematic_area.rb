class Itms::ProjectSecondaryThematicArea < ApplicationRecord
  include Itms::ProjectGoalCodelist

  self.table_name = 'itms.projekty_sekundarne_tematicke_okruhy'
end
