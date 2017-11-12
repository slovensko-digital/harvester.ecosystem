class Itms::NutsCode < ApplicationRecord
  self.table_name = 'itms.nuts_kody'

  belongs_to :hodnota_nuts, class_name: Itms::CodelistValue
end
