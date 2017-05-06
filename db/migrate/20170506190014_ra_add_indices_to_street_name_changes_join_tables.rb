class RaAddIndicesToStreetNameChangesJoinTables < ActiveRecord::Migration[5.0]
  def change
    add_index 'ra.street_name_changes_municipalities', 'street_name_change_id', name: 'street_name_changes_municipalities_change'
    add_index 'ra.street_name_changes_municipalities', 'municipality_id', name: 'street_name_changes_municipalities_municipality'
    add_index 'ra.street_name_changes_districts', 'street_name_change_id', name: 'street_name_changes_districts_change'
    add_index 'ra.street_name_changes_districts', 'district_id', name: 'street_name_changes_districts_district'
  end
end
