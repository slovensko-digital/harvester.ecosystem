class Itms::PlannedAppealGoal < ApplicationRecord
  self.table_name = 'itms.vyzvy_planovane_ciele'

  belongs_to :planned_appeal
end
