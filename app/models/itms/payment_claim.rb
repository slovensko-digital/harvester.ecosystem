class Itms::PaymentClaim < ApplicationRecord
  self.table_name = 'itms.zop'

  belongs_to :hlavny_cehranicny_partner, class_name: Itms::Subject
  belongs_to :predfinancovanie, class_name: Itms::PaymentClaim
  belongs_to :predkladana_za, class_name: Itms::Subject
  belongs_to :prijimatel, class_name: Itms::Subject
  belongs_to :projekt, class_name: Itms::Project
  has_many :deklarovane_vydavky,
           class_name: Itms::DeclaredExpense,
           foreign_key: 'zop_id',
           dependent: :destroy
end
