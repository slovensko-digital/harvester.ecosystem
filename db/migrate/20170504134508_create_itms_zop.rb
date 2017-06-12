class CreateItmsZop < ActiveRecord::Migration[5.0]

  ZOP_STATES = %w(predlozene uhradene zamietnute)

  def up
    ZOP_STATES.each do |zop_state|
      create_table "itms.zop_#{zop_state}" do |t|
        t.integer :itms_identifier, null: false, limit: 8, unique: true
        t.string :kod
        t.string :typ
        t.decimal :narokovana_suma
        t.datetime :created_at
        t.datetime :updated_at
        t.datetime :datum_prijatia
        t.boolean :vyplaca_sa_partnerovi
        t.boolean :zop_je_zaverecna
      end

      create_table "itms.zop_#{zop_state}_predfinancovanie" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zop_#{zop_state}_id", null: false, limit: 8
      end
      add_foreign_key "itms.zop_#{zop_state}_predfinancovanie", "itms.zop_#{zop_state}", column: "zop_#{zop_state}_id"

      create_table "itms.zop_#{zop_state}_predkladana_za" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zop_#{zop_state}_id", null: false, limit: 8
        t.string :ico
        t.string :dic
        t.string :ine_identifikacne_cislo
      end
      add_foreign_key "itms.zop_#{zop_state}_predkladana_za", "itms.zop_#{zop_state}", column: "zop_#{zop_state}_id"

      create_table "itms.zop_#{zop_state}_prijimatel" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zop_#{zop_state}_id", null: false, limit: 8
        t.string :ico
        t.string :dic
        t.string :ine_identifikacne_cislo
      end
      add_foreign_key "itms.zop_#{zop_state}_prijimatel", "itms.zop_#{zop_state}", column: "zop_#{zop_state}_id"

      create_table "itms.zop_#{zop_state}_projekt" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zop_#{zop_state}_id", null: false, limit: 8
      end
      add_foreign_key "itms.zop_#{zop_state}_projekt", "itms.zop_#{zop_state}", column: "zop_#{zop_state}_id"
    end
  end

  def down
    ZOP_STATES.each do |zop_state|
      drop_table "itms.zop_#{zop_state}"
      drop_table "itms.zop_#{zop_state}_predfinancovanie"
      drop_table "itms.zop_#{zop_state}_predkladana_za"
      drop_table "itms.zop_#{zop_state}_prijimatel"
      drop_table "itms.zop_#{zop_state}_projekt"
    end
  end
end
