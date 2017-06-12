class Itms::ProcurementContractSupplier < ApplicationRecord
  self.table_name = 'itms.zmluvy_verejne_obstaravanie_dodavatelia'

  belongs_to :procurement_contract
  has_one :procurement_contract_supplier_supplier, foreign_key: :zmluvy_verejne_obstaravanie_dodavatelia_id
end
