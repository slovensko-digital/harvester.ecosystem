class Itms::OperationalProgram < ApplicationRecord
  self.table_name = 'itms.operacne_programy'

  belongs_to :subjekt, class_name: 'Itms::Subject', optional: true
end
