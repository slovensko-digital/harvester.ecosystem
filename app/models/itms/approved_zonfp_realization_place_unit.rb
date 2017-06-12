class Itms::ApprovedZonfpRealizationPlaceUnit < ApplicationRecord
  self.table_name = 'itms.zonfp_schvalene_miesta_realizacie_units'

  belongs_to :approved_zonfp_realization_place
end
