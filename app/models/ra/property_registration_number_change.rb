class Ra::PropertyRegistrationNumberChange < ApplicationRecord
  belongs_to :property_registration_number_object,
    :foreign_key => 'property_registration_number_id',
    :class_name => 'Ra::PropertyRegistrationNumber',
    :required => true
  belongs_to :building_purpose, :class_name => 'Ra::BuildingPurpose', optional: true
  belongs_to :building_type, :class_name => 'Ra::BuildingType', optional: true
end
