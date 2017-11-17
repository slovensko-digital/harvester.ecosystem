class Itms::DeclaredExpenseUnclaimedSum < ApplicationRecord
  self.table_name = 'itms.deklarovane_vydavky_sumy_neziadane_na_preplatenie'

  belongs_to :deklarovany_vydavok, class_name: Itms::DeclaredExpense
end
