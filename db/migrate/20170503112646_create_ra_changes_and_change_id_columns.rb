class CreateRaChangesAndChangeIdColumns < ActiveRecord::Migration[5.0]
  def change
    create_table 'ra.changes'

    add_reference 'ra.region_changes', :change, foreign_key: {to_table: 'ra.changes'}
    add_reference 'ra.county_changes', :change, foreign_key: {to_table: 'ra.changes'}
    add_reference 'ra.municipality_changes', :change, foreign_key: {to_table: 'ra.changes'}
    add_reference 'ra.district_changes', :change, foreign_key: {to_table: 'ra.changes'}
    add_reference 'ra.street_name_changes', :change, foreign_key: {to_table: 'ra.changes'}
    add_reference 'ra.property_registration_number_changes', :change, foreign_key: {to_table: 'ra.changes'}
    add_reference 'ra.building_number_changes', :change, foreign_key: {to_table: 'ra.changes'}
    add_reference 'ra.building_unit_changes', :change, foreign_key: {to_table: 'ra.changes'}
  end
end
