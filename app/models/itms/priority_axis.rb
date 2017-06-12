class Itms::PriorityAxis < ApplicationRecord
  self.table_name = 'itms.prioritne_osi'

  has_one :priority_axis_operation_program, foreign_key: :prioritne_osi_id
end
