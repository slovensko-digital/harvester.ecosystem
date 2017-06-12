class Itms::RejectedZonfpTerritorialMechanismGoal < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_uzemne_mechanizmy_ciele'

  belongs_to :rejected_zonfp_territorial_mechanism, foreign_key: :zonfp_zamietnute_uzemne_mechanizmy_id, primary_key: :id
end
