class Itms::PlannedAppeal < ApplicationRecord
  self.table_name = 'itms.vyzvy_planovane'

  has_many :planned_appeal_info, foreign_key: :vyzvy_planovane_id
  has_many :planned_appeal_goals, foreign_key: :vyzvy_planovane_id
  has_many :planned_appeal_providers, foreign_key: :vyzvy_planovane_id
  has_one :planned_appeal_announcer, foreign_key: :vyzvy_planovane_id
end
