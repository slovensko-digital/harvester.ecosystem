class CreateRaBuildingUnitChanges < ActiveRecord::Migration[5.0]
  def change
    create_table 'ra.building_unit_changes' do |t|
      t.integer :building_unit_id, null: false
      t.integer :building_number_id, null: false
      t.datetime :changed_at, null: false
      t.column :database_operation, 'ra.change_type'
      t.integer :version_id, null: false
      t.column :created_reason, 'ra.created_reason_type'
      t.datetime :valid_from, null: false
      t.datetime :valid_to, null: false
      t.date :effective_on, null: false
      t.string :building_unit_floor, null: false
      t.string :building_unit_number, null: false
      t.string :building_unit_label, null: false
      t.timestamps
    end
  end
end
