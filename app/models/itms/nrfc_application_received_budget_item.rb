class Itms::NrfcApplicationReceivedBudgetItem < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_polozky_rozpoctu'

  belongs_to :skupina_vydavkov, class_name: 'Itms::CodelistValue'
end
