class Itms::CodeSpecificGoal < ApplicationRecord
  self.table_name = 'itms.kody_konkretne_ciele'

  belongs_to :konkretny_ciel, class_name: Itms::SpecificGoal
end
