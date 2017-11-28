class Itms::DeclaredExpense < ApplicationRecord
  self.table_name = 'itms.deklarovane_vydavky'

  belongs_to :zop, class_name: 'Itms::PaymentClaim'
  belongs_to :polozka_rozpoctu, class_name: 'Itms::BudgetItem'
  has_many :suma_neschvalena_na_preplatenie,
           class_name: 'Itms::DeclaredExpenseUnpaidSum',
           foreign_key: 'deklarovany_vydavok_id',
           dependent: :destroy
  has_many :suma_neziadana_na_preplatenie,
           class_name: 'Itms::DeclaredExpenseUnclaimedSum',
           foreign_key: 'deklarovany_vydavok_id',
           dependent: :destroy
  belongs_to :verejne_obstaravanie, class_name: 'Itms::Procurement'
  belongs_to :uctovny_doklad, class_name: 'Itms::AccountingDocument'
  belongs_to :zmluva_verejne_obstaravanie, class_name: 'Itms::ProcurementContract'
end
