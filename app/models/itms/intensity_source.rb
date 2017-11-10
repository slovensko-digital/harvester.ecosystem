class Itms::IntensitySource < ApplicationRecord
  self.table_name = 'itms.zdroje_intenzit'

  belongs_to :zdroj, class_name: Itms::CodelistValue
end
