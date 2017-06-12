class Itms::ProcurementContract < ApplicationRecord
  self.table_name = 'itms.zmluvy_verejne_obstaravanie'

  belongs_to :procurement_contract_procurement, class_name: 'Itms::Procurement', foreign_key: :verejne_obstaravania_id
  has_many :procurement_contract_another_urls, foreign_key: :zmluvy_verejne_obstaravanie_id
  has_many :procurement_contract_suppliers, foreign_key: :zmluvy_verejne_obstaravanie_id
  has_one :procurement_contract_main_supplier, foreign_key: :zmluvy_verejne_obstaravanie_id
end
