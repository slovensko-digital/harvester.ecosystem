class Itms::ProcurementOperationalProgram < ApplicationRecord
  self.table_name = 'itms.verejne_obstaravania_operacne_programy'

  belongs_to :verejne_obstaravanie, class_name: Itms::Procurement
  belongs_to :operacny_program, class_name: Itms::OperationalProgram
end
