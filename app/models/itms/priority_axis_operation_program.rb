class Itms::PriorityAxisOperationProgram < ApplicationRecord
  self.table_name = 'itms.prioritna_os_operacne_programy'

  belongs_to :priority_axis
end
