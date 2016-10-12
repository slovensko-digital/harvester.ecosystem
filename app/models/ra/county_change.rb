class Ra::CountyChange < ApplicationRecord
  belongs_to :county_code, :class_name => 'Ra::CountyCode'
end
