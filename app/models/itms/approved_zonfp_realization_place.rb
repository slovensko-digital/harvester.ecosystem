class Itms::ApprovedZonfpRealizationPlace < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_miesta_realizacie'

  belongs_to :approved_zonfp
  has_many :approved_zonfp_realization_place_units, foreign_key: :zonfp_schvalene_miesta_realizacie_id
end
