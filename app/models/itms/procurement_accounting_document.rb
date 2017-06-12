class Itms::ProcurementAccountingDocument < ApplicationRecord
  self.table_name = 'itms.verejne_obstaravania_uctovne_doklady'

  belongs_to :procurement
end
