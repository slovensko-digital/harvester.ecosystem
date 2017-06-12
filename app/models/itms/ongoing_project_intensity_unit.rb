class Itms::OngoingProjectIntensityUnit < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_intenzity_subjekty'

  belongs_to :ongoing_project_intensity
end
