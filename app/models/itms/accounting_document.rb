class Itms::AccountingDocument < ApplicationRecord
  self.table_name = 'itms.uctovne_doklady'

  has_many :accounting_document_items, foreign_key: :uctovne_doklady_id
  has_many :accounting_document_projects, foreign_key: :uctovne_doklady_id
  has_many :accounting_document_procurements, foreign_key: :uctovne_doklady_id
  has_one :accounting_document_supplier, foreign_key: :uctovne_doklady_id
  has_one :accounting_document_owner, foreign_key: :uctovne_doklady_id
end
