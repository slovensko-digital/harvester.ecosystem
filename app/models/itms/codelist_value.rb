class Itms::CodelistValue < ApplicationRecord
  self.table_name = 'itms.hodnoty_ciselnikov'

  belongs_to :ciselnik, class_name: Itms::Codelist
end
