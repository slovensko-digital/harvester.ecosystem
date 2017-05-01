class Ra::StreetNameChange < ApplicationRecord
  belongs_to :street_name_object,
    :foreign_key => 'street_name_id',
    :class_name => 'Ra::StreetName',
    :required => true
end
