class Itms::PlannedAppealInfo < ApplicationRecord
  self.table_name = 'itms.vyzvy_planovane_doplnujuce_info'

  belongs_to :planned_appeal
end
