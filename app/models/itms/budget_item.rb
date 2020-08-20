class Itms::BudgetItem < ApplicationRecord
  self.table_name = 'itms.polozky_rozpoctu'

  belongs_to :aktivita, class_name: 'Itms::Activity', optional: true
  belongs_to :intenzita, class_name: 'Itms::Intensity', optional: true
  belongs_to :skupina_vydavkov, class_name: 'Itms::CodelistValue', optional: true
  belongs_to :subjekt, class_name: 'Itms::Subject', optional: true
end
