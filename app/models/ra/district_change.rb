class Ra::DistrictChange < ApplicationRecord
  belongs_to :district_object,
    :foreign_key => 'district_id',
    :class_name => 'Ra::District',
    :required => true
  belongs_to :district_code, :class_name => 'Ra::DistrictCode'
end
