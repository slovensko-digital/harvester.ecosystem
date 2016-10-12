class Ra::RegionChange < ApplicationRecord
  belongs_to :region_code, :class_name => 'Ra::RegionCode'
end
