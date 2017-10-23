class Itms::ProjectIntensity < ApplicationRecord
  self.table_name = 'itms.projekty_intenzity'

  belongs_to :intenzita, class_name: Itms::Intensity
end
