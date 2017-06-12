class Itms::RejectedZopPreFinancing < ApplicationRecord
  self.table_name = 'itms.zop_zamietnute_predfinancovanie'

  belongs_to :rejected_zop
end
