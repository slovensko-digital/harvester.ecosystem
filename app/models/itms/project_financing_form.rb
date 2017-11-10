class Itms::ProjectFinancingForm < ApplicationRecord
  include Itms::ProjectGoalCodelist

  self.table_name = 'itms.projekty_formy_financovania'
end
