class Itms::RejectedZopRecipient < ApplicationRecord
  self.table_name = 'itms.zop_zamietnute_prijimatel'

  belongs_to :rejected_zop
end
