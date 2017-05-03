class Ra::MunicipalityChange < ApplicationRecord
  belongs_to :change, optional: true
  belongs_to :municipality_object, foreign_key: 'municipality_id', class_name: 'Ra::Municipality'
  belongs_to :county, class_name: 'Ra::County', optional: true
  belongs_to :municipality_code, class_name: 'Ra::MunicipalityCode'
end
