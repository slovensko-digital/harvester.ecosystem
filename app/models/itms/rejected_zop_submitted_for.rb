class Itms::RejectedZopSubmittedFor < ApplicationRecord
  self.table_name = 'itms.zop_zamietnute_predkladana_za'

  belongs_to :rejected_zop
end
