class Itms::FinishedProjectFinancingFormGoal < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_formy_financovania_ciele'

  belongs_to :ifinished_project_financing_form
end
