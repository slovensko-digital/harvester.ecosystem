class Itms::FinishedProjectRealizationPlace < ApplicationRecord
  self.table_name = 'itms.projekty_ukoncene_miesta_realizacie'

  belongs_to :finished_project
  has_many :finished_project_realization_place_units, foreign_key: :projekty_ukoncene_miesta_realizacie_id
end
