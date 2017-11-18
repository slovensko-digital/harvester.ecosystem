class Itms::NrfcApplicationBudgetItem < ApplicationRecord
  self.table_name = 'itms.zonfp_polozky_rozpoctu'

  belongs_to :zonfp, class_name: Itms::NrfcApplication
  belongs_to :skupina_vydavkov, class_name: Itms::CodelistValue
end
