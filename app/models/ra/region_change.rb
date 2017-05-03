class Ra::RegionChange < ApplicationRecord
  belongs_to :change, optional: true
  belongs_to :region_object, foreign_key: 'region_id', class_name: 'Ra::Region'
  belongs_to :region_code, class_name: 'Ra::RegionCode'
end
