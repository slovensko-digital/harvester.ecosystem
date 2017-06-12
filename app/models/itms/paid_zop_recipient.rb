class Itms::PaidZopRecipient < ApplicationRecord
  self.table_name = 'itms.zop_uhradene_prijimatel'

  belongs_to :paid_zop
end
