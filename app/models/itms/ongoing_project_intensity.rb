class Itms::OngoingProjectIntensity < ApplicationRecord
  self.table_name = 'itms.projekty_vrealizacii_intenzity'

  belongs_to :ongoing_project
  has_many :ongoing_project_intensity_sources, foreign_key: :projekty_vrealizacii_intenzity_id, primary_key: :id
  has_one :ongoing_project_intensity_unit, foreign_key: :projekty_vrealizacii_intenzity_id, primary_key: :id
end
