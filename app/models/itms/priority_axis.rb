class Itms::PriorityAxis < ApplicationRecord
  self.table_name = 'itms.prioritne_osi'

  belongs_to :operacny_program, class_name: 'Itms::OperationalProgram', optional: true
end
