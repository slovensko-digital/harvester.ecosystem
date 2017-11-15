class Itms::Supplier < ApplicationRecord
  self.table_name = 'itms.dodavatelia'

  belongs_to :obec, class_name: Itms::NutsCode
  belongs_to :stat, class_name: Itms::CodelistValue
  belongs_to :typ_ineho_identifikacneho_cisla, class_name: Itms::CodelistValue
end
