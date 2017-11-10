class Itms::ProjectInterventionArea < ApplicationRecord
  include Itms::ProjectGoalCodelist

  self.table_name = 'itms.projekty_oblasti_intervencie'
end
