class Itms::PaidZop < ApplicationRecord
  self.table_name = 'itms.zop_uhradene'

  has_one :paid_zop_pre_financing, foreign_key: :zop_uhradene_id
  has_one :paid_zop_submitted_for, foreign_key: :zop_uhradene_id
  has_one :paid_zop_recipient, foreign_key: :zop_uhradene_id
  has_one :paid_zop_project, foreign_key: :zop_uhradene_id
end
