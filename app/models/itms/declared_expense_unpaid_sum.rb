class Itms::DeclaredExpenseUnpaidSum < ApplicationRecord
  self.table_name = 'itms.deklarovane_vydavky_sumy_neschvalene_na_preplatenie'

  belongs_to :deklarovany_vydavok, class_name: 'Itms::DeclaredExpense', optional: true
end
