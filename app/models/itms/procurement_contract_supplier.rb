class Itms::ProcurementContractSupplier < ApplicationRecord
  self.table_name = 'itms.zmluvy_verejne_obstaravania_dodavatelia'

  belongs_to :zmluva_verejne_obstaravanie, class_name: 'Itms::ProcurementContract'
  belongs_to :dodavatel_dodavatel_obstaravatel, class_name: 'Itms::Supplier', optional: true
  belongs_to :dodavatel_subjekt, class_name: 'Itms::Subject', optional: true
end
