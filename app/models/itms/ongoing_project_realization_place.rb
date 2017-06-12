class Itms::OngoingProjectRealizationPlace < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_miesta_realizacie'

  belongs_to :ongoing_project
  has_many :ongoing_project_realization_place_units, foreign_key: :projekty_vrealizacii_miesta_realizacie_id
end
