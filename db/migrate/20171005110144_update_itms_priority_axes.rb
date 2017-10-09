class UpdateItmsPriorityAxes < ActiveRecord::Migration[5.0]
  def change
    drop_table 'itms.prioritna_os_operacne_programy'
    drop_table 'itms.prioritne_osi'

    create_table 'itms.prioritne_osi' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.decimal :celkova_financna_alokacia
      t.decimal :hlavna_alokacia
      t.string :kod
      t.string :nazov
      t.references :operacny_program, index: true, foreign_key: { to_table: 'itms.operacne_programy' }
      t.decimal :vykonnostna_rezerva

      t.timestamps
    end
  end
end
