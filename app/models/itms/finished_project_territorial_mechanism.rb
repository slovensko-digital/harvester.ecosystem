class Itms::FinishedProjectTerritorialMechanism < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_uzemne_mechanizmy'

  belongs_to :finished_project
  has_one :finished_project_territorial_mechanism_goal, foreign_key: :projekty_ukoncene_uzemne_mechanizmy_id, primary_key: :id
end
