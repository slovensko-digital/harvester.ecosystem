class Itms::FinishedProjectFinancingForm < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_formy_financovania'

  belongs_to :finished_project
  has_one :finished_project_financing_form_goal, foreign_key: :projekty_ukoncene_formy_financovania_id, primary_key: :id
end
