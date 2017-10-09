class UpdateItmsOperationalPrograms < ActiveRecord::Migration[5.0]
  def change
    drop_table 'itms.operacne_programy_subjekty'
    drop_table 'itms.operacne_programy'

    create_table 'itms.operacne_programy' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.decimal :celkova_financna_alokacia
      t.decimal :hlavna_alokacia
      t.string :kod
      t.string :kod_cci
      t.string :nazov
      t.string :skratka
      t.references :subjekt, index: true, foreign_key: { to_table: 'itms.subjekty' }
      t.decimal :vykonnostna_rezerva

      t.timestamps
    end
  end
end
