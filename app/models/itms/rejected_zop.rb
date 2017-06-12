class Itms::RejectedZop < ApplicationRecord
  self.table_name = 'itms.zop_zamietnute'

  has_one :rejected_zop_pre_financing, foreign_key: :zop_zamietnute_id
  has_one :rejected_zop_submitted_for, foreign_key: :zop_zamietnute_id
  has_one :rejected_zop_recipient, foreign_key: :zop_zamietnute_id
  has_one :rejected_zop_project, foreign_key: :zop_zamietnute_id
end
