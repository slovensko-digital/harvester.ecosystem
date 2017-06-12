class Itms::ReceivedZonfpRealizationPlace < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_miesta_realizacie'

  belongs_to :received_zonfp
  has_many :received_zonfp_realization_place_units, foreign_key: :zonfp_prijate_miesta_realizacie_id
end
