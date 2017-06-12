class Itms::OngoingProjectRealizationPlaceUnit < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_miesta_realizacie_units'

  belongs_to :ongoing_project_realization_place
end
