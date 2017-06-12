class CreateItmsAccountingDocuments < ActiveRecord::Migration[5.0]
  def up
    create_table 'itms.uctovne_doklady' do |t|
      t.integer :itms_identifier, null: false, limit: 8, unique: true
      t.decimal :celkova_vyska_dokladu
      t.string :cislo_dokladu
      t.string :cislo_zmluvy_s_dodavatelom_bez_vo
      t.string :nazov
      t.string :typ
      t.datetime :datum_uhrady
      t.datetime :datum_vyhotovenia
      t.datetime :updated_at
      t.datetime :created_at
    end

    create_table 'itms.uctovne_doklady_dodavatel' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :uctovne_doklady_id, null: false, limit: 8, index: true
      t.string :ico
      t.string :ine_identifikacne_cislo
    end
    add_foreign_key 'itms.uctovne_doklady_dodavatel', 'itms.uctovne_doklady', column: 'uctovne_doklady_id'

    create_table 'itms.uctovne_doklady_polozky_dokladu' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :uctovne_doklady_id, null: false, limit: 8, index: { name: 'itms.ud_pd_id' }
      t.decimal :dph
      t.decimal :jednotkova_cena
      t.decimal :mnozstvo
      t.decimal :sadzba_dph
      t.decimal :suma_bez_dph
      t.decimal :suma_opravnena
      t.decimal :suma_spolu
      t.decimal :suma_ziadana
      t.decimal :suma_zrealizovanych_vydavkov
      t.string :nazov
      t.integer :poradove_cislo, limit: 8
    end
    add_foreign_key 'itms.uctovne_doklady_polozky_dokladu', 'itms.uctovne_doklady', column: 'uctovne_doklady_id'

    create_table 'itms.uctovne_doklady_projekty' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :uctovne_doklady_id, null: false, limit: 8,index: true
    end
    add_foreign_key 'itms.uctovne_doklady_projekty', 'itms.uctovne_doklady', column: 'uctovne_doklady_id'

    create_table 'itms.uctovne_doklady_verejne_obstaravania' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :uctovne_doklady_id, null: false, limit: 8, index: { name: 'itms.ud_vo_id' }
    end
    add_foreign_key 'itms.uctovne_doklady_verejne_obstaravania', 'itms.uctovne_doklady', column: 'uctovne_doklady_id'

    create_table 'itms.uctovne_doklady_vlastnik_dokladu' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :uctovne_doklady_id, null: false, limit: 8, index: { name: 'itms.ud_vd_id' }
      t.string :ico
      t.string :ine_identifikacne_cislo
    end
    add_foreign_key 'itms.uctovne_doklady_vlastnik_dokladu', 'itms.uctovne_doklady', column: 'uctovne_doklady_id'
  end

  def down
    drop_table 'itms.uctovne_doklady_dodavatel'
    drop_table 'itms.uctovne_doklady_polozky_dokladu'
    drop_table 'itms.uctovne_doklady_projekty'
    drop_table 'itms.uctovne_doklady_verejne_obstaravania'
    drop_table 'itms.uctovne_doklady_vlastnik_dokladu'
    drop_table 'itms.uctovne_doklady'
  end
end
