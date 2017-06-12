class Itms::ProcurementContractAnotherUrl < ApplicationRecord
  self.table_name = 'itms.zmluvy_verejne_obstaravanie_dalsie_url'

  belongs_to :procurement_contract
end
