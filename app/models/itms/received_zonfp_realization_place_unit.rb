class Itms::ReceivedZonfpRealizationPlaceUnit < ApplicationRecord
  self.table_name = 'itms.zonfp_prijate_miesta_realizacie_units'

  belongs_to :received_zonfp_realization_place
end
