class Itms::Intensity < ApplicationRecord
  self.table_name = 'itms.intenzity'

  belongs_to :subjekt, class_name: 'Itms::Subject'
  belongs_to :zdroj_eu, class_name: 'Itms::IntensitySource'
  belongs_to :zdroj_pr, class_name: 'Itms::IntensitySource'
  belongs_to :zdroj_sr, class_name: 'Itms::IntensitySource'
  belongs_to :zdroj_vz, class_name: 'Itms::IntensitySource'
  belongs_to :zdroj_yei, class_name: 'Itms::IntensitySource'
end
