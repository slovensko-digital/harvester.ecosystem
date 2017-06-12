class Itms::ReceivedZonfpPartner < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_partneri'

  belongs_to :received_zonfp
end
