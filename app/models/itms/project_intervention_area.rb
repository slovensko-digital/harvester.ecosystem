class Itms::ProjectInterventionArea < ApplicationRecord
  self.table_name = 'itms.projekty_oblasti_intervencie'

  belongs_to :oblast_intervencie, class_name: Itms::CodeSpecificGoal
end
