class Itms::PaidZopProject < ApplicationRecord
  self.table_name = 'itms.zop_uhradene_projekt'

  belongs_to :paid_zop
end
