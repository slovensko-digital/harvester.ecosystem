class Ra::CountyChange < ApplicationRecord
  belongs_to :change, optional: true
  belongs_to :county_object, foreign_key: 'county_id', class_name: 'Ra::County'
  belongs_to :region, class_name: 'Ra::Region', optional: true
  belongs_to :county_code, class_name: 'Ra::CountyCode'
end
