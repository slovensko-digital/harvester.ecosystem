class Itms::RejectedZonfpApplicant < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_ziadatel'

  belongs_to :rejected_zonfp
end
