class Itms::OngoingProjectFinancingFormGoal < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_formy_financovania_ciele'

  belongs_to :ongoing_project_financing_form
end
