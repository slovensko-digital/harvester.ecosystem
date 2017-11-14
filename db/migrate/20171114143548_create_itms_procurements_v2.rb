class CreateItmsProcurementsV2 < ActiveRecord::Migration[5.0]
  def change
    drop_table 'itms.verejne_obstaravania', force: :cascade
    drop_table 'itms.verejne_obstaravania_druh_zakazky', force: :cascade
    drop_table 'itms.verejne_obstaravania_hlavny_predmet_doplnkovy_slovniky', force: :cascade
    drop_table 'itms.verejne_obstaravania_hlavny_predmet_hlavny_slovniky', force: :cascade
    drop_table 'itms.verejne_obstaravania_metody_vo', force: :cascade
    drop_table 'itms.verejne_obstaravania_obstaravatel', force: :cascade
    drop_table 'itms.verejne_obstaravania_operacne_programy', force: :cascade
    drop_table 'itms.verejne_obstaravania_postup_obstaravania', force: :cascade
    drop_table 'itms.verejne_obstaravania_projekty', force: :cascade
    drop_table 'itms.verejne_obstaravania_uctovne_doklady', force: :cascade
    drop_table 'itms.verejne_obstaravania_zadavatel', force: :cascade

    create_table 'itms.verejne_obstaravania' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.boolean :centralne_obstaravanie
      t.string :cislo_vestnika
      t.string :cislo_zverejnenia_vo_vestniku
      t.datetime :datum_zverejnenia_vo_vestniku
      t.references :druh_zakazky, index: true, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.references :hlavny_predmet_hlavny_slovnik, index: { name: 'index_itms.vo_on_hlavny_predmet_hlavny_slovnik' }, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.string :kod
      t.string :kriterium_na_vyhodnotenie_ponuk
      t.datetime :lehota_na_predkladanie_ponuk
      t.datetime :lehota_na_predkladanie_ziadosti_o_ucast
      t.references :metoda_vo, index: true, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.string :nazov
      t.boolean :obmedzenie_poctu_uchadzacov
      t.references :obstaravatel_dodavatel_obstaravatel, index: { name: 'index_itms.vo_on_obstaravatel_dodavatel_obstaravatel' }, foreign_key: { to_table: 'itms.dodavatelia' }
      t.references :obstaravatel_subjekt, index: true, foreign_key: { to_table: 'itms.subjekty' }
      t.integer :pocet_prijatych_ponuk
      t.integer :pocet_vylucenych_ponuk
      t.references :postup_obstaravania, index: true, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.boolean :predchadzajuce_oznamenie
      t.decimal :predpokladana_hodnota_zakazky
      t.string :stav
      t.decimal :trvanie_zakazky_hodnota
      t.string :trvanie_zakazky_merna_jednotka
      t.string :url_odkaz_oznamenie
      t.boolean :zadavanie_zakazky_v_mene_inych_obstaravatelov
      t.references :zadavatel, index: true, foreign_key: { to_table: 'itms.subjekty' }
      t.boolean :zakazka_rozdelena_na_viac_casti
      t.boolean :zverejnene_vo_vestniku_eu

      t.timestamps
    end

    create_table 'itms.verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik' do |t|
      t.references :verejne_obstaravanie,
                   null: false,
                   index: { name: 'index_itms.vo_doplnujuce_predmety_doplnkovy_slovnik_vo' },
                   foreign_key: { to_table: 'itms.verejne_obstaravania' }
      t.references :predmet,
                   null: false,
                   index: { name: 'index_itms.vo_doplnujuce_predmety_doplnkovy_slovnik_predmet' },
                   foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.timestamps
    end
    add_index 'itms.verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik',
              [:verejne_obstaravanie_id, :predmet_id],
              name: 'index_itms.vo_doplnujuce_predmety_doplnkovy_slovnik_vo_predmet',
              unique: true

    create_table 'itms.verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik' do |t|
      t.references :verejne_obstaravanie,
                   null: false,
                   index: { name: 'index_itms.vo_doplnujuce_predmety_hlavny_slovnik_vo' },
                   foreign_key: { to_table: 'itms.verejne_obstaravania' }
      t.references :predmet,
                   null: false,
                   index: { name: 'index_itms.vo_doplnujuce_predmety_hlavny_slovnik_predmet' },
                   foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.timestamps
    end
    add_index 'itms.verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik',
              [:verejne_obstaravanie_id, :predmet_id],
              name: 'index_itms.vo_doplnujuce_predmety_hlavny_slovnik_vo_predmet',
              unique: true
    
    
    create_table 'itms.verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik' do |t|
      t.references :verejne_obstaravanie,
                   null: false,
                   index: { name: 'index_itms.vo_hlavne_predmety_doplnkovy_slovnik_vo' },
                   foreign_key: { to_table: 'itms.verejne_obstaravania' }
      t.references :predmet,
                   null: false,
                   index: { name: 'index_itms.vo_hlavne_predmety_doplnkovy_slovnik_predmet' },
                   foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.timestamps
    end
    add_index 'itms.verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik',
              [:verejne_obstaravanie_id, :predmet_id],
              name: 'index_itms.vo_hlavne_predmety_doplnkovy_slovnik_vo_predmet',
              unique: true

    create_table 'itms.verejne_obstaravania_operacne_programy' do |t|
      t.references :verejne_obstaravanie,
                   null: false,
                   index: { name: 'index_itms.verejne_obstaravania_operacne_programy_on_vo' },
                   foreign_key: { to_table: 'itms.verejne_obstaravania' }
      t.references :operacny_program,
                   null: false,
                   index: { name: 'index_itms.verejne_obstaravania_operacne_programy_on_op' },
                   foreign_key: { to_table: 'itms.operacne_programy' }
      t.timestamps
    end
    add_index 'itms.verejne_obstaravania_operacne_programy',
              [:verejne_obstaravanie_id, :operacny_program_id],
              name: 'index_itms.verejne_obstaravania_operacne_programy_on_vo_and_op',
              unique: true

    create_table 'itms.verejne_obstaravania_projekty' do |t|
      t.references :verejne_obstaravanie,
                   null: false,
                   index: { name: 'index_itms.verejne_obstaravania_projekty_on_vo' },
                   foreign_key: { to_table: 'itms.verejne_obstaravania' }
      t.references :projekt,
                   null: false,
                   index: { name: 'index_itms.verejne_obstaravania_projekty_on_p' },
                   foreign_key: { to_table: 'itms.projekty' }
      t.timestamps
    end
    add_index 'itms.verejne_obstaravania_projekty',
              [:verejne_obstaravanie_id, :projekt_id],
              name: 'index_itms.verejne_obstaravania_projekty_on_vo_and_p',
              unique: true
    
    
    create_table 'itms.verejne_obstaravania_uctovne_doklady' do |t|
      t.references :verejne_obstaravanie,
                   null: false,
                   index: { name: 'index_itms.verejne_obstaravania_uctovne_doklady_on_vo' },
                   foreign_key: { to_table: 'itms.verejne_obstaravania' }
      t.references :uctovny_doklad,
                   null: false,
                   index: { name: 'index_itms.verejne_obstaravania_uctovne_doklady_on_ud' },
                   foreign_key: { to_table: 'itms.uctovne_doklady' }
      t.timestamps
    end
    add_index 'itms.verejne_obstaravania_uctovne_doklady',
              [:verejne_obstaravanie_id, :uctovny_doklad_id],
              name: 'index_itms.verejne_obstaravania_uctovne_doklady_on_vo_and_ud',
              unique: true
  end
end
