class CreateRaForeignKeysWithConsolidatedModelsStubs < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key 'ra.region_changes', 'ra.regions', column: 'region_id'

    add_foreign_key 'ra.county_changes', 'ra.counties', column: 'county_id'
    add_foreign_key 'ra.county_changes', 'ra.regions', column: 'region_id'

    add_foreign_key 'ra.municipality_changes', 'ra.municipalities', column: 'municipality_id'
    add_foreign_key 'ra.municipality_changes', 'ra.counties', column: 'county_id'
    add_reference 'ra.municipality_changes', :city, foreign_key: {to_table: 'ra.municipalities'}

    add_foreign_key 'ra.district_changes', 'ra.districts', column: 'district_id'
    add_foreign_key 'ra.district_changes', 'ra.municipalities', column: 'municipality_id'

    add_foreign_key 'ra.street_name_changes', 'ra.street_names', column: 'street_name_id'

    add_foreign_key 'ra.property_registration_number_changes', 'ra.property_registration_numbers', column: 'property_registration_number_id'
    add_foreign_key 'ra.property_registration_number_changes', 'ra.municipalities', column: 'municipality_id'
    add_foreign_key 'ra.property_registration_number_changes', 'ra.districts', column: 'district_id'

    add_foreign_key 'ra.building_number_changes', 'ra.building_numbers', column: 'building_number_id'
    add_foreign_key 'ra.building_number_changes', 'ra.property_registration_numbers', column: 'property_registration_number_id'
    add_foreign_key 'ra.building_number_changes', 'ra.street_names', column: 'street_name_id'

    add_foreign_key 'ra.building_unit_changes', 'ra.building_units', column: 'building_unit_id'
  end
end
