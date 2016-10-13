class CreateRaMunicipalityChanges < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      CREATE TYPE ra.municipality_status AS ENUM ('MUNICIPALITY', 'CITY_DISTRICT', 'CITY', 'CITY_MANAGED_BY_SPECIAL_LAW', 'MILITARY_DISTRICT');
    SQL

    create_table 'ra.municipality_changes' do |t|
      t.integer :municipality_id, null: false
      t.integer :county_id, null: false
      t.column :database_operation, 'ra.change_type'
      t.integer :version_id, null: false
      t.column :created_reason, 'ra.created_reason_type'
      t.datetime :changed_at
      t.datetime :valid_from
      t.datetime :valid_to
      t.integer :municipality_code_id, null: false
      t.column :municipality_status, 'ra.municipality_status'
      t.timestamps
    end
  end

  def down
    drop_table 'ra.municipality_changes'

    execute <<-SQL
      DROP TYPE ra.municipality_status;
    SQL
  end
end
