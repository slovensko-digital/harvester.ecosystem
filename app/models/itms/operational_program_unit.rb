class Itms::OperationalProgramUnit < ApplicationRecord
  self.table_name = 'itms.operacne_programy_subjekty'

  belongs_to :operational_program
end
