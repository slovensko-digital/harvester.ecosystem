class Itms::OngoingProjectEconomicActivityGoal < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_hospodarske_cinnosti_ciele'

  belongs_to :ongoing_project_economic_activity
end
