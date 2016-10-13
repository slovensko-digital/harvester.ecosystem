class AddVersionIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index 'ra.building_number_changes', :version_id
    add_index 'ra.property_registration_number_changes', :version_id
  end
end
