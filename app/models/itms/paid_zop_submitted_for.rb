class Itms::PaidZopSubmittedFor < ApplicationRecord
  self.table_name = 'itms.zop_uhradene_predkladana_za'

  belongs_to :paid_zop
end
