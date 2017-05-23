class Ra::DistrictChange < ApplicationRecord
  belongs_to :change, optional: true
  belongs_to :district_object, foreign_key: 'district_id', class_name: 'Ra::District'
  belongs_to :municipality, class_name: 'Ra::Municipality', optional: true
  belongs_to :district_code, class_name: 'Ra::DistrictCode'
end
