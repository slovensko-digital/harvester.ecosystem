class CreateRaStreetNameChanges < ActiveRecord::Migration[5.0]
  def change
    create_table 'ra.street_name_changes' do |t|
      t.integer :street_name_id, null: false
      t.integer :municipality_id, null: false
      t.integer :district_id
      t.datetime :changed_at, null: false
      t.column :database_operation, 'ra.change_type'
      t.integer :version_id, null: false
      t.column :created_reason, 'ra.created_reason_type'
      t.datetime :valid_from, null: false
      t.datetime :valid_to, null: false
      t.date :effective_on, null: false
      t.string :street_name, null: false

      t.timestamps
    end
  end
end
