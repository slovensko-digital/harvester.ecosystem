class Itms::ProcurementMethodVo < ApplicationRecord
  self.table_name = 'itms.verejne_obstaravania_metody_vo'

  belongs_to :procurement
end
