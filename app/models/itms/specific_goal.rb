class Itms::SpecificGoal < ApplicationRecord
  self.table_name = 'itms.konkretne_ciele'

  belongs_to :fond, class_name: Itms::CodelistValue
end
