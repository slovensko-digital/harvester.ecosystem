class Itms::ProcurementContractAdditionalUrl < ApplicationRecord
  self.table_name = 'itms.zmluvy_verejne_obstaravania_dalsie_url'

  belongs_to :zmluva_verejne_obstaravanie, class_name: 'Itms::ProcurementContract', optional: true
end
