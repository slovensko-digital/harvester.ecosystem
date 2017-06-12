class Itms::RejectedZonfpTerritorialMechanism < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_uzemne_mechanizmy'

  belongs_to :rejected_zonfp
  has_one :rejected_zonfp_territorial_mechanism_goal, foreign_key: :zonfp_zamietnute_uzemne_mechanizmy_id, primary_key: :id
end
