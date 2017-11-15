class CreateItmsProcurementContractsV2 < ActiveRecord::Migration[5.0]
  def change
    drop_table 'itms.zmluvy_verejne_obstaravanie', force: :cascade
    drop_table 'itms.zmluvy_verejne_obstaravanie_dalsie_url', force: :cascade
    drop_table 'itms.zmluvy_verejne_obstaravanie_dodavatelia', force: :cascade
    drop_table 'itms.zmluvy_verejne_obstaravanie_dodavatelia_dodavatel', force: :cascade
    drop_table 'itms.zmluvy_verejne_obstaravanie_hlavny_dodavatel', force: :cascade

    create_table 'itms.zmluvy_verejne_obstaravania' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.decimal :celkova_suma_zmluvy
      t.string :cislo_zmluvy
      t.datetime :datum_platnosti
      t.datetime :datum_ucinnosti
      t.references :hlavny_dodavatel_dodavatel_obstaravatel, index: { name: 'index_itms.zmluvy_verejne_obstaravania_hddo' }, foreign_key: { to_table: 'itms.dodavatelia' }
      t.references :hlavny_dodavatel_subjekt, index: { name: 'index_itms.zmluvy_verejne_obstaravania_hds' }, foreign_key: { to_table: 'itms.subjekty' }
      t.string :kod
      t.string :nazov
      t.string :predmet_zmluvy
      t.decimal :suma_bez_dph
      t.string :url_odkaz_na_zmluvu
      t.references :verejne_obstaravanie, index: { name: 'index_itms.zmluvy_verejne_obstaravania_vo' }, foreign_key: { to_table: 'itms.verejne_obstaravania' }
    end

    create_table 'itms.zmluvy_verejne_obstaravania_dalsie_url' do |t|
      t.references :zmluva_verejne_obstaravanie,
                   null: false,
                   index: { name: 'index_itms.zmluvy_verejne_obstaravania_dalsie_url_zvo' },
                   foreign_key: { to_table: 'itms.zmluvy_verejne_obstaravania' }
      t.string :nazov
      t.string :url
      t.timestamps
    end

    create_table 'itms.zmluvy_verejne_obstaravania_dodavatelia' do |t|
      t.references :zmluva_verejne_obstaravanie,
                   null: false,
                   index: { name: 'index_itms.zmluvy_verejne_obstaravania_dodavatelia_zvo' },
                   foreign_key: { to_table: 'itms.zmluvy_verejne_obstaravania' }
      t.references :dodavatel_dodavatel_obstaravatel,
                   index: { name: 'index_itms.zmluvy_verejne_obstaravania_dodavatelia_ddo' },
                   foreign_key: { to_table: 'itms.dodavatelia' }
      t.references :dodavatel_subjekt,
                   index: { name: 'index_itms.zmluvy_verejne_obstaravania_dodavatelia_ds' },
                   foreign_key: { to_table: 'itms.subjekty' }
      t.boolean :je_hlavny_dodavatel
      t.timestamps
    end
  end
end
