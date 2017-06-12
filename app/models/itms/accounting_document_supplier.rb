class Itms::AccountingDocumentSupplier < ApplicationRecord
  self.table_name = 'itms.uctovne_doklady_dodavatel'

  belongs_to :accounting_document
end
