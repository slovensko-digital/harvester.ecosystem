class Itms::RejectedZonfpRealizationPlace < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_miesta_realizacie'

  belongs_to :rejected_zonfp
  has_many :rejected_zonfp_realization_place_units, foreign_key: :zonfp_zamietnute_miesta_realizacie_id
end
