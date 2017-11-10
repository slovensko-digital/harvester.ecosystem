class Itms::ProjectTerritorialMechanism < ApplicationRecord
  include Itms::ProjectGoalCodelist

  self.table_name = 'itms.projekty_uzemne_mechanizmy'
end
