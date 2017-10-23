class Itms::ProjectFinancingForm < ApplicationRecord
  self.table_name = 'itms.projekty_formy_financovania'

  belongs_to :forma_financovania, class_name: Itms::SpecificGoalCode
end
