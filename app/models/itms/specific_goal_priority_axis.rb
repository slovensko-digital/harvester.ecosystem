class Itms::SpecificGoalPriorityAxis < ApplicationRecord
  self.table_name = 'itms.konkretne_ciele_prioritna_os'

  belongs_to :specific_goal
end
