class Itms::RejectedZonfpRealizationPlaceUnit < ApplicationRecord
  self.table_name = 'itms.zonfp_zamietnute_miesta_realizacie_units'

  belongs_to :rejected_zonfp_realization_place
end
