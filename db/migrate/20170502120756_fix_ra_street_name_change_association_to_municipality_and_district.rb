class FixRaStreetNameChangeAssociationToMunicipalityAndDistrict < ActiveRecord::Migration[5.0]
  def change
    create_table 'ra.street_name_changes_municipalities', id: false do |t|
      t.integer 'street_name_change_id', null: false
      t.integer 'municipality_id', null: false
    end
    create_table 'ra.street_name_changes_districts', id: false do |t|
      t.integer 'street_name_change_id', null: false
      t.integer 'district_id', null: false
    end

    remove_column 'ra.street_name_changes', :municipality_id
    remove_column 'ra.street_name_changes', :district_id

    add_foreign_key 'ra.street_name_changes_municipalities', 'ra.street_name_changes', column: 'street_name_change_id'
    add_foreign_key 'ra.street_name_changes_municipalities', 'ra.municipalities', column: 'municipality_id'
    add_foreign_key 'ra.street_name_changes_districts', 'ra.street_name_changes', column: 'street_name_change_id'
    add_foreign_key 'ra.street_name_changes_districts', 'ra.districts', column: 'district_id'
  end
end
