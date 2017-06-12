class Itms::ApprovedZonfpActivityProject < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_aktivity_projekty'

  belongs_to :approved_zonfp, foreign_key: :zonfp_schvalene_id
  has_one :approved_zonfp_activity_project_unit, foreign_key: :zonfp_schvalene_aktivity_projekty_id
end
