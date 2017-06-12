class Itms::FinishedProjectEconomicActivityGoal < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_hospodarske_cinnosti_ciele'

  belongs_to :finished_project_economic_activity
end
