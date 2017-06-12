class Itms::OngoingProjectTerritorialMechanism < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_uzemne_mechanizmy'

  belongs_to :ongoing_project
  has_one :ongoing_project_territorial_mechanism_goal, foreign_key: :projekty_vrealizacii_uzemne_mechanizmy_id, primary_key: :id
end
