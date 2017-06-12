class Itms::PlannedAppealProvider < ApplicationRecord
  self.table_name = 'itms.vyzvy_planovane_poskytovatelia'

  belongs_to :planned_appeal
end
