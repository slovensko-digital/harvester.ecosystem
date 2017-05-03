class UnifyRaCodelistTables < ActiveRecord::Migration[5.0]
  def change
    drop_table 'ra.building_types'
    create_table 'ra.building_type_codes' do |t|
      t.string :code
      t.string :name, null: false
      t.timestamps
    end
    add_index 'ra.building_type_codes', :code, unique: true
    rename_column 'ra.property_registration_number_changes', 'building_type_id', 'building_type_code_id'

    drop_table 'ra.building_purposes'
    create_table 'ra.building_purpose_codes' do |t|
      t.string :code
      t.string :name, null: false
      t.timestamps
    end
    add_index 'ra.building_purpose_codes', :code, unique: true
    rename_column 'ra.property_registration_number_changes', 'building_purpose_id', 'building_purpose_code_id'

    add_index 'ra.municipality_codes', :code, unique: true
    add_index 'ra.district_codes', :code, unique: true

    add_foreign_key 'ra.region_changes', 'ra.region_codes', column: 'region_code_id'
    add_foreign_key 'ra.county_changes', 'ra.county_codes', column: 'county_code_id'
    add_foreign_key 'ra.municipality_changes', 'ra.municipality_codes', column: 'municipality_code_id'
    add_foreign_key 'ra.district_changes', 'ra.district_codes', column: 'district_code_id'
    add_foreign_key 'ra.property_registration_number_changes', 'ra.building_type_codes', column: 'building_type_code_id'
    add_foreign_key 'ra.property_registration_number_changes', 'ra.building_purpose_codes', column: 'building_purpose_code_id'
  end
end
