class Itms::ProcurementProcedure < ApplicationRecord
  self.table_name = 'itms.verejne_obstaravania_postup_obstaravania'

  belongs_to :procurement
end
