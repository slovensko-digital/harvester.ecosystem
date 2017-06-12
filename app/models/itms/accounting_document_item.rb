class Itms::AccountingDocumentItem < ApplicationRecord
  self.table_name = 'itms.uctovne_doklady_polozky_dokladu'

  belongs_to :accounting_document
end
