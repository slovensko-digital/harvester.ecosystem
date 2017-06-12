class CreateItmsOperationalPrograms < ActiveRecord::Migration[5.0]
  def up
    create_table 'itms.operacne_programy' do |t|
      t.integer :itms_identifier, null: false, limit: 8, unique: true
      t.string :kod_cci
      t.string :kod
      t.string :nazov
      t.string :skratka
      t.datetime :updated_at
      t.datetime :created_at
    end

    create_table 'itms.operacne_programy_subjekty' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :operacne_programy_id, null: false, limit: 8
      t.string :ico
      t.string :ine_identifikacne_cislo
    end
    add_foreign_key 'itms.operacne_programy_subjekty', 'itms.operacne_programy', column: 'operacne_programy_id'
  end

  def down
    drop_table 'itms.operacne_programy_subjekty'
    drop_table 'itms.operacne_programy'
  end
end
