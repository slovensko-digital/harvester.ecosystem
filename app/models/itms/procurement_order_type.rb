class Itms::ProcurementOrderType < ApplicationRecord
  self.table_name = 'itms.verejne_obstaravania_druh_zakazky'

  belongs_to :procurement
end
