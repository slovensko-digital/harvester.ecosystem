class Itms::ProcurementAccountingDocument < ApplicationRecord
  self.table_name = 'itms.verejne_obstaravania_uctovne_doklady'

  belongs_to :verejne_obstaravanie, class_name: Itms::Procurement
  belongs_to :uctovny_doklad, class_name: Itms::AccountingDocument
end
