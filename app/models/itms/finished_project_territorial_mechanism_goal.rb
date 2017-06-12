class Itms::FinishedProjectTerritorialMechanismGoal < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_uzemne_mechanizmy_ciele'

  belongs_to :finished_project_territorial_mechanism
end
