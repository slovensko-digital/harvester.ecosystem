class Itms::SpecificGoal < ApplicationRecord
  self.table_name = 'itms.konkretne_ciele'

  has_one :specific_goal_priority_axis, foreign_key: :konkretne_ciele_id
end
