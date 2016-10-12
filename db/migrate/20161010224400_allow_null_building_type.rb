class AllowNullBuildingType < ActiveRecord::Migration[5.0]
  def change
    change_column_null 'ra.property_registration_number_changes', :building_type_id, true
  end
end
