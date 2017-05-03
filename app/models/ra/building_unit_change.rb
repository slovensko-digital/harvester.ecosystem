class Ra::BuildingUnitChange < ApplicationRecord
  belongs_to :change, optional: true
  belongs_to :building_unit_object, foreign_key: 'building_unit_id', class_name: 'Ra::BuildingUnit'
end
