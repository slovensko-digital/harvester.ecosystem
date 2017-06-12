class Itms::ReceivedZonfpApplicant < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_ziadatel'

  belongs_to :received_zonfp
end
