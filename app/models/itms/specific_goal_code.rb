class Itms::SpecificGoalCode < ApplicationRecord
  self.table_name = 'itms.kody_konkretnych_cielov'

  belongs_to :konkretny_ciel, class_name: Itms::SpecificGoal
end
