class Ra::DistrictChange < ApplicationRecord
  belongs_to :district_code, :class_name => 'Ra::DistrictCode'
end
