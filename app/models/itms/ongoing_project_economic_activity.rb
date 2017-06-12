class Itms::OngoingProjectEconomicActivity < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_hospodarske_cinnosti'

  belongs_to :ongoing_project
  has_one :ongoing_project_economic_activity_goal, foreign_key: :projekty_vrealizacii_hospodarske_cinnosti_id, primary_key: :id
end
