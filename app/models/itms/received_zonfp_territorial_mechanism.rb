class Itms::ReceivedZonfpTerritorialMechanism < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_uzemne_mechanizmy'

  belongs_to :received_zonfp
  has_one :received_zonfp_territorial_mechanism_goal, foreign_key: :zonfp_prijate_uzemne_mechanizmy_id, primary_key: :id
end
