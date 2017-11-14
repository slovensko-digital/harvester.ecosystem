class Itms::ProcurementProject < ApplicationRecord
  self.table_name = 'itms.verejne_obstaravania_projekty'

  belongs_to :verejne_obstaravanie, class_name: Itms::Procurement
  belongs_to :projekt, class_name: Itms::Project
end
