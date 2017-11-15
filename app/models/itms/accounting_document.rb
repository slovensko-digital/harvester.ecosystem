class Itms::AccountingDocument < ApplicationRecord
  self.table_name = 'itms.uctovne_doklady'

  belongs_to :dodavatel_dodavatel_obstaravatel, class_name: Itms::Supplier
  belongs_to :dodavatel_subjekt, class_name: Itms::Subject
  has_many :polozky_dokladu,
           -> { order(:poradove_cislo) },
           class_name: Itms::AccountingDocumentItem,
           foreign_key: 'uctovny_doklad_id'

  has_many :uctovne_doklady_verejne_obstaravania,
           class_name: Itms::ProcurementAccountingDocument,
           foreign_key: 'uctovny_doklad_id'
  has_many :verejne_obstaravania,
           through: :uctovne_doklady_verejne_obstaravania,
           source: :verejne_obstaravanie

  belongs_to :vlastnik_dokladu, class_name: Itms::Subject

  def projekty
    verejne_obstaravania.map(&:projekty)
  end
end
