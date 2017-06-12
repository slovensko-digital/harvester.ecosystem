class Itms::RejectedZonfpPartner < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_partneri'

  belongs_to :rejected_zonfp
end
