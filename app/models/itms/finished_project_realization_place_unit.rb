class Itms::FinishedProjectRealizationPlaceUnit < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_miesta_realizacie_units'

  belongs_to :finished_project_realization_place
end
