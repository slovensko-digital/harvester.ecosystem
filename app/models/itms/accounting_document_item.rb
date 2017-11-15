class Itms::AccountingDocumentItem < ApplicationRecord
  self.table_name = 'itms.uctovne_doklady_polozky_dokladu'

  belongs_to :uctovny_doklad, class_name: Itms::AccountingDocument
end
