class AllowNullPropertyRegistrationNumber < ActiveRecord::Migration[5.0]
  def change
    change_column_null 'ra.property_registration_number_changes', :property_registration_number, true
  end
end
