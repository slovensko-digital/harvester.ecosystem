class Itms::OngoingProjectFinancingForm < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_formy_financovania'

  belongs_to :ongoing__project
  has_one :ongoing_project_financing_form_goal, foreign_key: :projekty_vrealizacii_formy_financovania_id, primary_key: :id
end
