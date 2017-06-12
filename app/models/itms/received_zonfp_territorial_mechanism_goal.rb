class Itms::ReceivedZonfpTerritorialMechanismGoal < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_uzemne_mechanizmy_ciele'

  belongs_to :received_zonfp_territorial_mechanism, foreign_key: :zonfp_prijate_uzemne_mechanizmy_id, primary_key: :id
end
