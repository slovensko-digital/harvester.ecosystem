class CreateItmsDiscrepancies < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.nezrovnalosti' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.references :administrativny_stav, index: true, foreign_key: { to_table: 'itms.kody' }
      t.decimal :celkova_suma_nezrovnalosti
      t.decimal :celkova_suma_nezrovnalosti_zdroj_eu
      t.decimal :celkova_suma_nezrovnalosti_zdroj_pr
      t.decimal :celkova_suma_nezrovnalosti_zdroj_sr
      t.datetime :datum_prvej_informacie
      t.datetime :datum_zistenia
      #TODO :dlznik
      t.string :dopad_na_rozpocet_eu
      t.string :druh_nezrovnalosti
      t.references :financny_stav, index: true, foreign_key: { to_table: 'itms.kody' }
      t.references :hlavny_typ_nezrovnalosti, index: true, foreign_key: { to_table: 'itms.kody' }
      t.boolean :je_systemova
      t.string :kod
      #TODO :konkretny_ciel
      #TODO :operacny_program
      t.decimal :penale
      t.decimal :pokuty
      t.string :popis
      t.string :pouzite_praktiky
      #TODO :prioritna_os
      #TODO :projekt
      t.string :projekt_v_priprave_alebo_nerealizovany
      t.string :stanovisko_dlznika
      t.string :stanovisko_organu
      t.string :stav
      #TODO :subjekty_ktore_sposobili_nezrovnalost
      #TODO :subjekty_ktore_zistili_nezrovnalost
      #TODO :subjekty_zodpovedne_za_nasledne_konanie
      t.decimal :suma_na_vymahanie
      t.decimal :suma_na_vymahanie_zdroj_eu
      t.decimal :suma_na_vymahanie_zdroj_pr
      t.decimal :suma_na_vymahanie_zdroj_sr
      # TODO :suvisiace_nezrovnalosti
      # TODO :suvisiace_pohladavkove_doklady
      # TODO :suvisiace_verejne_obstaravania
      # TODO :suvisiace_zop
      # TODO :typy_nezrovnalosti
      t.decimal :vratena_suma
      t.decimal :vratena_suma_zdroj_eu
      t.decimal :vratena_suma_zdroj_pr
      t.decimal :vratena_suma_zdroj_sr

      t.timestamps
    end
  end
end
