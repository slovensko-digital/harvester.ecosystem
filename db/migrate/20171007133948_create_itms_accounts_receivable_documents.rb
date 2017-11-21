class CreateItmsAccountsReceivableDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.pohladavkove_doklady' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.datetime :datum_splatnosti
      t.datetime :datum_vzniku
      t.references :dlznik, foreign_key: { to_table: 'itms.subjekty' }
      t.string :dopad_na_rozpocet_eu
      t.references :dovod_vratenia, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.string :druh
      t.string :kod
      t.references :konkretny_ciel, foreign_key: { to_table: 'itms.konkretne_ciele' }
      t.references :nezrovnalost, foreign_key: { to_table: 'itms.nezrovnalosti' }
      t.references :prioritna_os, foreign_key: { to_table: 'itms.prioritne_osi' }
      t.references :projekt # Foreign key index in 20171120133917
      t.string :stav
      t.references :subjekt_zodpovedny_za_vymahanie, foreign_key: { to_table: 'itms.subjekty' }, index: { name: 'index_itms.pohladavkove_doklady_on_zodpovedny_subjekt' }
      t.decimal :suma_na_vratenie
      t.decimal :suma_na_vratenie_zdroj_eu
      t.decimal :suma_na_vratenie_zdroj_pr
      t.decimal :suma_na_vratenie_zdroj_sr
      t.string :typ
      t.boolean :vracia_sa_do_rozpoctu_projektu
      t.decimal :vratena_suma
      t.decimal :vratena_suma_zdroj_eu
      t.decimal :vratena_suma_zdroj_pr
      t.decimal :vratena_suma_zdroj_sr

      t.timestamps
    end
  end
end
