class CreateRaBuildingNumberChanges < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'postgis'

    create_table 'ra.building_number_changes' do |t|
      t.integer :property_registration_number_id, null: false
      t.integer :street_name_id
      t.datetime :changed_at
      t.column :database_operation, 'ra.change_type'
      t.integer :building_number_id, null: false
      t.integer :version_id, null: false
      t.column :created_reason, 'ra.created_reason_type'
      t.datetime :valid_from
      t.datetime :valid_to
      t.date :effective_on
      t.datetime :verified_at
      t.string :building_number
      t.string :building_index, null: false
      t.integer :postal_code
      t.st_point :address_point, geographic: true
      t.timestamps
    end
  end
end
