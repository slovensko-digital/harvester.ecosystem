class Itms::IntensitySource < ApplicationRecord
  self.table_name = 'itms.intenzity_zdroje'

  belongs_to :zdroj, class_name: 'Itms::CodelistValue', optional: true
end
