class CreateItmsProcurementContracts < ActiveRecord::Migration[5.0]
  def up
    create_table 'itms.zmluvy_verejne_obstaravanie' do |t|
      t.integer :verejne_obstaravania_id, null: false, limit: 8
      t.integer :itms_identifier, null: false, limit: 8, unique: true
      t.string :cislo_zmluvy
      t.string :kod
      t.string :nazov
      t.string :predmet_zmluvy
      t.string :url_odkaz_na_zmluvu
      t.decimal :celkova_suma_zmluvy
      t.decimal :suma_bez_dph
      t.datetime :datum_platnosti
      t.datetime :datum_ucinnosti
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_foreign_key 'itms.zmluvy_verejne_obstaravanie', 'itms.verejne_obstaravania', column: 'verejne_obstaravania_id'

    create_table 'itms.zmluvy_verejne_obstaravanie_dalsie_url' do |t|
      t.integer :zmluvy_verejne_obstaravanie_id, null: false, limit: 8
      t.string :nazov
      t.string :url
    end
    add_foreign_key 'itms.zmluvy_verejne_obstaravanie_dalsie_url', 'itms.zmluvy_verejne_obstaravanie', column: 'zmluvy_verejne_obstaravanie_id'

    create_table 'itms.zmluvy_verejne_obstaravanie_dodavatelia' do |t|
      t.integer :zmluvy_verejne_obstaravanie_id, null: false, limit: 8
      t.boolean :je_hlavny_dodavatel
    end
    add_foreign_key 'itms.zmluvy_verejne_obstaravanie_dodavatelia', 'itms.zmluvy_verejne_obstaravanie', column: 'zmluvy_verejne_obstaravanie_id'

    create_table 'itms.zmluvy_verejne_obstaravanie_dodavatelia_dodavatel' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :zmluvy_verejne_obstaravanie_dodavatelia_id, null: false, limit: 8
      t.string :ico
      t.string :ine_identifikacne_cislo
    end
    add_foreign_key 'itms.zmluvy_verejne_obstaravanie_dodavatelia_dodavatel', 'itms.zmluvy_verejne_obstaravanie_dodavatelia', column: 'zmluvy_verejne_obstaravanie_dodavatelia_id'

    create_table 'itms.zmluvy_verejne_obstaravanie_hlavny_dodavatel' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :zmluvy_verejne_obstaravanie_id, null: false, limit: 8
      t.string :ico
      t.string :ine_identifikacne_cislo
    end
    add_foreign_key 'itms.zmluvy_verejne_obstaravanie_hlavny_dodavatel', 'itms.zmluvy_verejne_obstaravanie', column: 'zmluvy_verejne_obstaravanie_id'
  end

  def down
    drop_table 'itms.zmluvy_verejne_obstaravanie_dalsie_url'
    drop_table 'itms.zmluvy_verejne_obstaravanie_dodavatelia_dodavatel'
    drop_table 'itms.zmluvy_verejne_obstaravanie_dodavatelia'
    drop_table 'itms.zmluvy_verejne_obstaravanie_hlavny_dodavatel'
    drop_table 'itms.zmluvy_verejne_obstaravanie'
  end
end
