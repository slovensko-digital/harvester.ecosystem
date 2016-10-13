class CreateRaCountyChanges < ActiveRecord::Migration[5.0]
  def change
    create_table 'ra.county_changes' do |t|
      t.integer :county_id, null: false
      t.integer :region_id, null: false
      t.column :database_operation, 'ra.change_type'
      t.integer :version_id, null: false
      t.column :created_reason, 'ra.created_reason_type'
      t.datetime :changed_at
      t.datetime :valid_from
      t.datetime :valid_to
      t.date :effective_on, null: false
      t.integer :county_code_id, null: false
      t.timestamps
    end
  end
end
