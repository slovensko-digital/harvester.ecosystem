class CreatePriorityAxes < ActiveRecord::Migration[5.0]
  def up
    create_table 'itms.prioritne_osi' do |t|
      t.integer :itms_identifier, null: false, limit: 8, unique: true
      t.string :nazov
      t.string :kod
      t.datetime :updated_at
      t.datetime :created_at
    end

    create_table 'itms.prioritna_os_operacne_programy' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :prioritne_osi_id, null: false, limit: 8
    end
    add_foreign_key 'itms.prioritna_os_operacne_programy', 'itms.prioritne_osi', column: 'prioritne_osi_id'
  end

  def down
    drop_table 'itms.prioritna_os_operacne_programy'
    drop_table 'itms.prioritne_osi'
  end
end
