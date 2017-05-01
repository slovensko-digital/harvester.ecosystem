class Ra::CountyChange < ApplicationRecord
  belongs_to :county_object,
    :foreign_key => 'county_id',
    :class_name => 'Ra::County',
    :required => true
  belongs_to :county_code, :class_name => 'Ra::CountyCode'
end
