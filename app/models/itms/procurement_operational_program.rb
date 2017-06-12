class Itms::ProcurementOperationalProgram < ApplicationRecord
  self.table_name = 'itms.verejne_obstaravania_operacne_programy'

  belongs_to :procurement
end
