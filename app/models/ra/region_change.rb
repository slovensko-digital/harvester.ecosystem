class Ra::RegionChange < ApplicationRecord
  belongs_to :region_object,
    :foreign_key => 'region_id',
    :class_name => 'Ra::Region',
    :required => true
  belongs_to :region_code, :class_name => 'Ra::RegionCode'
end
