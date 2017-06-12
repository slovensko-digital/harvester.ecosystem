class Itms::ProcurementFactotum < ApplicationRecord
  self.table_name = 'itms.verejne_obstaravania_obstaravatel'

  belongs_to :procurement
end
