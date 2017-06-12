class Itms::ApprovedZonfpTerritorialMechanism < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_uzemne_mechanizmy'

  belongs_to :approved_zonfp
  has_one :approved_zonfp_territorial_mechanism_goal, foreign_key: :zonfp_schvalene_uzemne_mechanizmy_id, primary_key: :id
end
