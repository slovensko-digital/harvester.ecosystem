class CreateItmsDiscrepancies < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.nezrovnalosti' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.references :administrativny_stav, index: true, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.decimal :celkova_suma_nezrovnalosti
      t.decimal :celkova_suma_nezrovnalosti_zdroj_eu
      t.decimal :celkova_suma_nezrovnalosti_zdroj_pr
      t.decimal :celkova_suma_nezrovnalosti_zdroj_sr
      t.datetime :datum_prvej_informacie
      t.datetime :datum_zistenia
      t.references :dlznik, foreign_key: { to_table: 'itms.subjekty' }
      t.string :dopad_na_rozpocet_eu
      t.string :druh_nezrovnalosti
      t.references :financny_stav, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.references :hlavny_typ_nezrovnalosti, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.boolean :je_systemova
      t.string :kod
      t.references :konkretny_ciel, foreign_key: { to_table: 'itms.konkretne_ciele' }
      t.references :operacny_program, foreign_key: { to_table: 'itms.operacne_programy' }
      t.decimal :penale
      t.decimal :pokuty
      t.string :popis
      t.string :pouzite_praktiky
      t.references :prioritna_os, foreign_key: { to_table: 'itms.prioritne_osi' }
      t.references :projekt # Foreign key in 20171120133917
      t.string :projekt_v_priprave_alebo_nerealizovany
      t.string :stanovisko_dlznika
      t.string :stanovisko_organu
      t.string :stav
      t.decimal :suma_na_vymahanie
      t.decimal :suma_na_vymahanie_zdroj_eu
      t.decimal :suma_na_vymahanie_zdroj_pr
      t.decimal :suma_na_vymahanie_zdroj_sr
      t.decimal :vratena_suma
      t.decimal :vratena_suma_zdroj_eu
      t.decimal :vratena_suma_zdroj_pr
      t.decimal :vratena_suma_zdroj_sr

      t.timestamps
    end
  end
end
