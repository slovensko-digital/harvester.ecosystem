class Itms::AccountingDocumentProcurement < ApplicationRecord
  self.table_name = 'itms.uctovne_doklady_verejne_obstaravania'

  belongs_to :accounting_document
end
