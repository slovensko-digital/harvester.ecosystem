class Itms::PaidZopPreFinancing < ApplicationRecord
  self.table_name = 'itms.zop_uhradene_predfinancovanie'

  belongs_to :paid_zop
end
