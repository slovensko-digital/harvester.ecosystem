class Ra::BuildingNumberChange < ApplicationRecord
  belongs_to :building_number_object,
    :foreign_key => 'building_number_id',
    :class_name => 'Ra::BuildingNumber',
    :required => true
end
