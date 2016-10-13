class RenameRaInternalId < ActiveRecord::Migration[5.0]
  def change
    rename_column 'ra.property_registration_number_changes', :internal_id, :property_registration_number_id
  end
end
