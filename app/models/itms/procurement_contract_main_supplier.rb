class Itms::ProcurementContractMainSupplier < ApplicationRecord
  self.table_name = 'itms.zmluvy_verejne_obstaravanie_hlavny_dodavatel'

  belongs_to :procurement_contract
end
