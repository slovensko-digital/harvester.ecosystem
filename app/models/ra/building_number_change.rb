class Ra::BuildingNumberChange < ApplicationRecord
  belongs_to :change, optional: true
  belongs_to :building_number_object,
    foreign_key: 'building_number_id',
    class_name: 'Ra::BuildingNumber'
  belongs_to :property_registration_number,
    class_name: Ra::PropertyRegistrationNumber,
    optional: true
  belongs_to :street_name, class_name: Ra::StreetName, optional: true
end
