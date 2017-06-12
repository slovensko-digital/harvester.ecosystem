class Itms::Procurement < ApplicationRecord
  self.table_name = 'itms.verejne_obstaravania'

  has_many :procurement_additional_vocabularies, foreign_key: :verejne_obstaravania_id
  has_many :procurement_operational_programs, foreign_key: :verejne_obstaravania_id
  has_many :procurement_projects, foreign_key: :verejne_obstaravania_id
  has_many :procurement_accounting_documents, foreign_key: :verejne_obstaravania_id
  has_one :procurement_order_type, foreign_key: :verejne_obstaravania_id
  has_one :procurement_main_vocabulary, foreign_key: :verejne_obstaravania_id
  has_one :procurement_method_vo, foreign_key: :verejne_obstaravania_id
  has_one :procurement_factotum, foreign_key: :verejne_obstaravania_id
  has_one :procurement_procedure, foreign_key: :verejne_obstaravania_id
  has_one :procurement_submitter, foreign_key: :verejne_obstaravania_id
  has_one :contract, class_name: 'Itms::ProcurementContract', foreign_key: :verejne_obstaravania_id
end
