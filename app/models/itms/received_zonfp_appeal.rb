class Itms::ReceivedZonfpAppeal < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_vyzvy'

  belongs_to :received_zonfp
end
