class Itms::Subject < ApplicationRecord
  self.table_name = 'itms.subjekty'

  belongs_to :obec, class_name: 'Itms::NutsCode', optional: true
  belongs_to :stat, class_name: 'Itms::CodelistValue', optional: true
  belongs_to :typ_ineho_identifikacneho_cisla, class_name: 'Itms::CodelistValue', optional: true
end
