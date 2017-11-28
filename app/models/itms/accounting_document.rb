class Itms::AccountingDocument < ApplicationRecord
  self.table_name = 'itms.uctovne_doklady'

  belongs_to :dodavatel_dodavatel_obstaravatel, class_name: 'Itms::Supplier'
  belongs_to :dodavatel_subjekt, class_name: 'Itms::Subject'
  has_many :polozky_dokladu,
           -> { order(:poradove_cislo) },
           class_name: 'Itms::AccountingDocumentItem',
           foreign_key: 'uctovny_doklad_id',
           dependent: :destroy

  has_and_belongs_to_many :verejne_obstaravania,
                          class_name: 'Itms::Procurement',
                          join_table: 'itms.verejne_obstaravania_uctovne_doklady',
                          association_foreign_key: :verejne_obstaravanie_id,
                          foreign_key: :uctovny_doklad_id

  belongs_to :vlastnik_dokladu, class_name: 'Itms::Subject'

  def projekty
    verejne_obstaravania.map(&:projekty)
  end
end
