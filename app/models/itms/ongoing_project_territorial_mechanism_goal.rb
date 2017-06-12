class Itms::OngoingProjectTerritorialMechanismGoal < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_uzemne_mechanizmy_ciele'

  belongs_to :ongoing_project_territorial_mechanism
end
