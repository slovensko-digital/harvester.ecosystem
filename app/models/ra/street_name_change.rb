class Ra::StreetNameChange < ApplicationRecord
  belongs_to :street_name_object, class_name: 'Ra::StreetName', foreign_key: 'street_name_id'
  has_and_belongs_to_many :municipalities,
    class_name: 'Ra::Municipality',
    join_table: 'ra.street_name_changes_municipalities'
  has_and_belongs_to_many :districts,
    class_name: 'Ra::District',
    join_table: 'ra.street_name_changes_districts'
end
