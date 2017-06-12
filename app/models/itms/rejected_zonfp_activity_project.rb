class Itms::RejectedZonfpActivityProject < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_aktivity_projekty'

  belongs_to :rejected_zonfp, foreign_key: :zonfp_zamietnute_id
  has_one :rejected_zonfp_activity_project_unit, foreign_key: :zonfp_zamietnute_aktivity_projekty_id
end
