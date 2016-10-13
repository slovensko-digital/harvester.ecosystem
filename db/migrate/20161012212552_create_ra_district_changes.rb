class CreateRaDistrictChanges < ActiveRecord::Migration[5.0]
  def change
    create_table 'ra.district_changes' do |t|
      t.integer :district_id, null: false
      t.integer :municipality_id, null: false
      t.column :database_operation, 'ra.change_type'
      t.integer :version_id, null: false
      t.column :created_reason, 'ra.created_reason_type'
      t.datetime :changed_at
      t.datetime :valid_from
      t.datetime :valid_to
      t.date :effective_on
      t.integer :district_code_id, null: false
      t.boolean :unique_numbering, null: false
      t.timestamps
    end
  end
end
