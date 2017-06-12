class Itms::SubmittedZop < ApplicationRecord
  self.table_name = 'itms.zop_predlozene'

  has_one :submitted_zop_pre_financing, foreign_key: :zop_predlozene_id
  has_one :submitted_zop_submitted_for, foreign_key: :zop_predlozene_id
  has_one :submitted_zop_recipient, foreign_key: :zop_predlozene_id
  has_one :submitted_zop_project, foreign_key: :zop_predlozene_id
end
