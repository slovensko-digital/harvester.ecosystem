class Itms::OngoingProjectIntensitySource < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_intenzity_zdroje'

  belongs_to :ongoing_project_intensity
end
