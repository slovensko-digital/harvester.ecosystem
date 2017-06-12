class Itms::RejectedZopProject < ApplicationRecord
  self.table_name = 'itms.zop_zamietnute_projekt'

  belongs_to :rejected_zop
end
