class Itms::ProcurementProject < ApplicationRecord
  self.table_name = 'itms.verejne_obstaravania_projekty'

  belongs_to :procurement
end
