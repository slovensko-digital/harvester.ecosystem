class Itms::OperationalProgram < ApplicationRecord
  self.table_name = 'itms.operacne_programy'

  has_one :operational_program_unit, foreign_key: :operacne_programy_id
end
