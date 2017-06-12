class Itms::ApprovedZonfpTerritorialMechanismGoal < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_uzemne_mechanizmy_ciele'

  belongs_to :approved_zonfp_territorial_mechanism, foreign_key: :zonfp_schvalene_uzemne_mechanizmy_id, primary_key: :id
end
