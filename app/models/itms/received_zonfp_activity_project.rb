class Itms::ReceivedZonfpActivityProject < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_aktivity_projekty'

  belongs_to :received_zonfp, foreign_key: :zonfp_prijate_id
  has_one :received_zonfp_activity_project_unit, foreign_key: :zonfp_prijate_aktivity_projekty_id
end
