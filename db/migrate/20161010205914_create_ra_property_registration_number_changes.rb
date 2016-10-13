class CreateRaPropertyRegistrationNumberChanges < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      CREATE TYPE ra.change_type AS ENUM ('INSERT', 'UPDATE', 'DELETE');
    SQL

    execute <<-SQL
      CREATE TYPE ra.created_reason_type AS ENUM ('IMPORT', 'CREATE', 'UPDATE', 'CANCEL', 'CORRECT', 'REVERT');
    SQL

    create_table 'ra.property_registration_number_changes' do |t|
      t.datetime :changed_at, null: false
      t.column :database_operation, 'ra.change_type'
      t.integer :internal_id, null: false
      t.integer :version_id, null: false
      t.column :created_reason, 'ra.created_reason_type'
      t.datetime :valid_from, null: false
      t.datetime :valid_to, null: false
      t.date :effective_on, null: false
      t.integer :property_registration_number, null: false
      t.boolean :building_contains_flats, null: false
      t.integer :building_purpose_id
      t.integer :building_type_id, null: false
      t.integer :municipality_id, null: false
      t.integer :district_id
      t.timestamps
    end
  end

  def down
    drop_table 'ra.property_registration_number_changes'

    execute <<-SQL
      DROP TYPE ra.change_type;
      DROP TYPE ra.created_reason_type;
    SQL
  end
end
