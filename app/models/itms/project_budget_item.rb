class Itms::ProjectBudgetItem < ApplicationRecord
  self.table_name = 'itms.projekty_polozky_rozpoctu'

  belongs_to :projekt, class_name: Itms::Project
  belongs_to :polozka_rozpoctu, class_name: Itms::BudgetItem
end
