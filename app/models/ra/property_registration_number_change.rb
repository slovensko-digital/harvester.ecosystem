class Ra::PropertyRegistrationNumberChange < ApplicationRecord
  belongs_to :building_purpose, :class_name => 'Ra::BuildingPurpose', optional: true
  belongs_to :building_type, :class_name => 'Ra::BuildingType', optional: true
end
