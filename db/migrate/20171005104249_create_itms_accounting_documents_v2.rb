class CreateItmsAccountingDocumentsV2 < ActiveRecord::Migration[5.0]
  def change
    drop_table 'itms.uctovne_doklady', force: :cascade
    drop_table 'itms.uctovne_doklady_dodavatel', force: :cascade
    drop_table 'itms.uctovne_doklady_polozky_dokladu', force: :cascade
    drop_table 'itms.uctovne_doklady_projekty', force: :cascade
    drop_table 'itms.uctovne_doklady_verejne_obstaravania', force: :cascade
    drop_table 'itms.uctovne_doklady_vlastnik_dokladu', force: :cascade
    
    create_table 'itms.uctovne_doklady' do |t|
      t.integer :itms_id, null: false, index: { unique: true }
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.datetime :datum_uhrady
      t.datetime :datum_vyhotovenia
      t.references :dodavatel_dodavatel_obstaravatel,
                   foreign_key: { to_table: 'itms.dodavatelia' },
                   index: { name: 'index_itms.uctovne_doklady_on_ddo' }
      t.references :dodavatel_subjekt, foreign_key: { to_table: 'itms.subjekty' }
      t.string :nazov
      t.string :typ
      t.references :vlastnik_dokladu, foreign_key: { to_table: 'itms.subjekty' }

      t.timestamps
    end

    create_table 'itms.uctovne_doklady_polozky_dokladu' do |t|
      t.references :uctovny_doklad, foreign_key: { to_table: 'itms.uctovne_doklady' }
      t.integer :itms_id, null: false, index: { unique: true }
      t.decimal :dph
      t.decimal :jednotkova_cena
      t.decimal :mnozstvo
      t.string :nazov
      t.integer :poradove_cislo
      t.decimal :sadzba_dph
      t.decimal :suma_bez_dph
      t.decimal :suma_opravnena
      t.decimal :suma_spolu
      t.decimal :suma_ziadana
      t.decimal :suma_zrealizovanych_vydavkov
      t.timestamps
    end
  end
end
