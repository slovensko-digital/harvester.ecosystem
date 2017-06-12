class CreateItmsProcurements < ActiveRecord::Migration[5.0]
  def up
    create_table 'itms.verejne_obstaravania' do |t|
      t.integer :itms_identifier, null: false, limit: 8, unique: true
      t.string :cislo_vestnika
      t.string :cislo_zverejnenia_vo_vestniku
      t.string :kod
      t.string :nazov
      t.string :stav
      t.string :url_odkaz_oznamenie
      t.integer :pocet_prijatych_ponuk, limit: 8
      t.integer :pocet_vylucenych_ponuk, limit: 8
      t.decimal :predpokladana_hodnota_zakazky
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :datum_zverejnenia_vo_vestniku
      t.boolean :zverejnene_vo_vestniku_eu
    end

    create_table 'itms.verejne_obstaravania_druh_zakazky' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :verejne_obstaravania_id, null: false, limit: 8
      t.string :kod_zdroj
      t.string :nazov
    end
    add_foreign_key 'itms.verejne_obstaravania_druh_zakazky', 'itms.verejne_obstaravania', column: 'verejne_obstaravania_id'

    create_table 'itms.verejne_obstaravania_hlavny_predmet_doplnkovy_slovniky' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :verejne_obstaravania_id, null: false, limit: 8
      t.string :kod_zdroj
      t.string :nazov
    end
    add_foreign_key 'itms.verejne_obstaravania_hlavny_predmet_doplnkovy_slovniky', 'itms.verejne_obstaravania', column: 'verejne_obstaravania_id'

    create_table 'itms.verejne_obstaravania_hlavny_predmet_hlavny_slovniky' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :verejne_obstaravania_id, null: false, limit: 8
      t.string :kod_zdroj
      t.string :nazov
    end
    add_foreign_key 'itms.verejne_obstaravania_hlavny_predmet_hlavny_slovniky', 'itms.verejne_obstaravania', column: 'verejne_obstaravania_id'

    create_table 'itms.verejne_obstaravania_metody_vo' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :verejne_obstaravania_id, null: false, limit: 8
      t.string :kod_zdroj
      t.string :nazov
    end
    add_foreign_key 'itms.verejne_obstaravania_metody_vo', 'itms.verejne_obstaravania', column: 'verejne_obstaravania_id'

    create_table 'itms.verejne_obstaravania_obstaravatel' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :verejne_obstaravania_id, null: false, limit: 8
      t.string :ico
      t.string :ine_identifikacne_cislo
    end
    add_foreign_key 'itms.verejne_obstaravania_obstaravatel', 'itms.verejne_obstaravania', column: 'verejne_obstaravania_id'

    create_table 'itms.verejne_obstaravania_operacne_programy' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :verejne_obstaravania_id, null: false, limit: 8
    end
    add_foreign_key 'itms.verejne_obstaravania_operacne_programy', 'itms.verejne_obstaravania', column: 'verejne_obstaravania_id'

    create_table 'itms.verejne_obstaravania_postup_obstaravania' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :verejne_obstaravania_id, null: false, limit: 8
      t.string :kod_zdroj
      t.string :nazov
    end
    add_foreign_key 'itms.verejne_obstaravania_postup_obstaravania', 'itms.verejne_obstaravania', column: 'verejne_obstaravania_id'

    create_table 'itms.verejne_obstaravania_projekty' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :verejne_obstaravania_id, null: false, limit: 8
    end
    add_foreign_key 'itms.verejne_obstaravania_projekty', 'itms.verejne_obstaravania', column: 'verejne_obstaravania_id'

    create_table 'itms.verejne_obstaravania_uctovne_doklady' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :verejne_obstaravania_id, null: false, limit: 8
    end
    add_foreign_key 'itms.verejne_obstaravania_uctovne_doklady', 'itms.verejne_obstaravania', column: 'verejne_obstaravania_id'

    create_table 'itms.verejne_obstaravania_zadavatel' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :verejne_obstaravania_id, null: false, limit: 8
      t.string :ico
      t.string :ine_identifikacne_cislo
    end
    add_foreign_key 'itms.verejne_obstaravania_zadavatel', 'itms.verejne_obstaravania', column: 'verejne_obstaravania_id'
  end

  def down
    drop_table 'itms.verejne_obstaravania_druh_zakazky'
    drop_table 'itms.verejne_obstaravania_hlavny_predmet_doplnkovy_slovniky'
    drop_table 'itms.verejne_obstaravania_hlavny_predmet_hlavny_slovniky'
    drop_table 'itms.verejne_obstaravania_metody_vo'
    drop_table 'itms.verejne_obstaravania_obstaravatel'
    drop_table 'itms.verejne_obstaravania_operacne_programy'
    drop_table 'itms.verejne_obstaravania_postup_obstaravania'
    drop_table 'itms.verejne_obstaravania_projekty'
    drop_table 'itms.verejne_obstaravania_uctovne_doklady'
    drop_table 'itms.verejne_obstaravania_zadavatel'
    drop_table 'itms.verejne_obstaravania'
  end
end
