class Itms::ProcurementSubmitter < ApplicationRecord
  self.table_name = 'itms.verejne_obstaravania_zadavatel'

  belongs_to :procurement
end
