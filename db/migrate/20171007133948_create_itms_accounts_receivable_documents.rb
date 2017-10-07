class CreateItmsAccountsReceivableDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.pohladavkove_doklady' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.datetime :datum_splatnosti
      t.datetime :datum_vzniku
      t.references :dlznik, index: true, foreign_key: { to_table: 'itms.subjekty' }
      t.string :dopad_na_rozpocet_eu
      t.references :dovod_vratenia, index: true, foreign_key: { to_table: 'itms.kody' }
      t.string :druh
      t.string :kod
      t.references :konkretny_ciel, index: true, foreign_key: { to_table: 'itms.konkretne_ciele' }
      t.references :nezrovnalost, index: true, foreign_key: { to_table: 'itms.nezrovnalosti' }
      t.string :stav
      t.references :subjekt_zodpovedny_za_vymahanie, index: { name: 'index_itms.pohladavkove_doklady_on_zodpovedny_subjekt' }, foreign_key: { to_table: 'itms.subjekty' }
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
    end
  end
end
