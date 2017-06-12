class Itms::ProcurementContractSupplierSupplier < ApplicationRecord
  self.table_name = 'itms.zmluvy_verejne_obstaravanie_dodavatelia_dodavatel'

  belongs_to :procurement_contract_supplier
end
