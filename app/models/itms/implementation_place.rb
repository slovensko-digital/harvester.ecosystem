class Itms::ImplementationPlace < ApplicationRecord
self.table_name = 'itms.miesta_realizacie'

  belongs_to :nuts_3, class_name: 'Itms::NutsCode', optional: true
  belongs_to :nuts_4, class_name: 'Itms::NutsCode', optional: true
  belongs_to :nuts_5, class_name: 'Itms::NutsCode', optional: true
  belongs_to :stat, class_name: 'Itms::CodelistValue', optional: true
end
