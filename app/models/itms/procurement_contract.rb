class Itms::ProcurementContract < ApplicationRecord
  self.table_name = 'itms.zmluvy_verejne_obstaravania'

  belongs_to :verejne_obstaravanie, class_name: 'Itms::Procurement', optional: true

  belongs_to :hlavny_predmet_hlavny_slovnik, class_name: 'Itms::CodelistValue', optional: true
  belongs_to :hlavny_dodavatel_dodavatel_obstaravatel, class_name: 'Itms::Supplier', optional: true
  belongs_to :hlavny_dodavatel_subjekt, class_name: 'Itms::Subject', optional: true

  has_many :dalsie_url,
           class_name: 'Itms::ProcurementContractAdditionalUrl',
           foreign_key: 'zmluva_verejne_obstaravanie_id',
           dependent: :destroy

  has_many :dodavatelia,
           class_name: 'Itms::ProcurementContractSupplier',
           foreign_key: 'zmluva_verejne_obstaravanie_id',
           dependent: :destroy
end
