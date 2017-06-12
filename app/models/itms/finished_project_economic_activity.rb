class Itms::FinishedProjectEconomicActivity < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_hospodarske_cinnosti'

  belongs_to :finished_project
  has_one :finished_project_economic_activity_goal, foreign_key: :projekty_ukoncene_hospodarske_cinnosti_id, primary_key: :id
end
