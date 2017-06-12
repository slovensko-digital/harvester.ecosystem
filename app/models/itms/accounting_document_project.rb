class Itms::AccountingDocumentProject < ApplicationRecord
  self.table_name = 'itms.uctovne_doklady_projekty'

  belongs_to :accounting_document
end
