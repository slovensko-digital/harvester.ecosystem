class Ra::PropertyRegistrationNumberChange < ApplicationRecord
  belongs_to :change, optional: true
  belongs_to :property_registration_number_object,
    foreign_key: 'property_registration_number_id',
    class_name: 'Ra::PropertyRegistrationNumber',
    :required => true
  belongs_to :municipality, class_name: 'Ra::Municipality', optional: true
  belongs_to :district, class_name: 'Ra::District', optional: true
  belongs_to :building_purpose_code, optional: true
  belongs_to :building_type_code, optional: true
end
