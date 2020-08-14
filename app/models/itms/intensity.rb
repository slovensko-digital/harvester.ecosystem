class Itms::Intensity < ApplicationRecord
  self.table_name = 'itms.intenzity'

  belongs_to :subjekt, class_name: 'Itms::Subject', optional: true
  belongs_to :zdroj_eu, class_name: 'Itms::IntensitySource', optional: true
  belongs_to :zdroj_pr, class_name: 'Itms::IntensitySource', optional: true
  belongs_to :zdroj_sr, class_name: 'Itms::IntensitySource', optional: true
  belongs_to :zdroj_vz, class_name: 'Itms::IntensitySource', optional: true
  belongs_to :zdroj_yei, class_name: 'Itms::IntensitySource', optional: true
end
