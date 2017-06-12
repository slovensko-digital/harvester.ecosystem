class Itms::AccountingDocumentOwner < ApplicationRecord
  self.table_name = 'itms.uctovne_doklady_vlastnik_dokladu'

  belongs_to :accounting_document
end
