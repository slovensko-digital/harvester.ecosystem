class Itms::RejectedZonfpAppeal < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_vyzvy'

  belongs_to :rejected_zonfp
end
