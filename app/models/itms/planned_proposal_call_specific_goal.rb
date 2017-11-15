class Itms::PlannedProposalCallSpecificGoal < ApplicationRecord
  self.table_name = 'itms.vyzvy_planovane_konkretne_ciele'

  belongs_to :vyzva, class_name: Itms::PlannedProposalCall
  belongs_to :konkretny_ciel, class_name: Itms::SpecificGoal
end
