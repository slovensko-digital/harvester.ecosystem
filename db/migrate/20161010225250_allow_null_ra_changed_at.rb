class AllowNullRaChangedAt < ActiveRecord::Migration[5.0]
  def change
    change_column_null 'ra.property_registration_number_changes', :changed_at, true
    change_column_null 'ra.property_registration_number_changes', :valid_from, true
    change_column_null 'ra.property_registration_number_changes', :valid_to, true
    change_column_null 'ra.property_registration_number_changes', :effective_on, true
  end
end
