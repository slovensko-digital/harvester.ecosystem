class CreateItmsAnnouncedProposalCalls < ActiveRecord::Migration[5.0]
  def change
    drop_table 'itms.vyzvy_vyhlasene', force: :cascade
    drop_table 'itms.vyzvy_vyhlasene_ciele', force: :cascade
    drop_table 'itms.vyzvy_vyhlasene_doplnujuce_info', force: :cascade
    drop_table 'itms.vyzvy_vyhlasene_fondy', force: :cascade
    drop_table 'itms.vyzvy_vyhlasene_poskytovatelia', force: :cascade
    drop_table 'itms.vyzvy_vyhlasene_vyhlasovatel', force: :cascade
    drop_table 'itms.vzvy_vyhlasene_kontaktne_osoby', force: :cascade
    drop_table 'itms.vzvy_vyhlasene_planovane_vyzvy', force: :cascade
    drop_table 'itms.vzvy_vyhlasene_posudzovane_obdobia', force: :cascade

    create_table 'itms.vyzvy_vyhlasene' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.decimal :alokacia_eu
      t.decimal :alokacia_sr
      t.datetime :datum_uzavretia
      t.datetime :datum_vyhlasenia
      t.string :druh
      t.string :kod
      t.string :nazov
      t.string :stav
      t.boolean :technicka_asistencia
      t.string :typ
      t.references :vyhlasovatel, foreign_key: { to_table: 'itms.subjekty' }

      t.timestamps
    end

    create_table 'itms.vyzvy_vyhlasene_doplnujuce_info' do |t|
      t.references :vyzva, null: false, foreign_key: { to_table: 'itms.vyzvy_vyhlasene' }
      t.string :nazov
      t.string :url
      t.timestamps
    end

    create_table 'itms.vyzvy_vyhlasene_fondy' do |t|
      t.references :vyzva, null: false, foreign_key: { to_table: 'itms.vyzvy_vyhlasene' }
      t.references :fond, null: false, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.timestamps
    end

    create_table 'itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit' do |t|
      t.references :vyzva, null: false, foreign_key: { to_table: 'itms.vyzvy_vyhlasene' }, index: { name: 'index_itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_on_v' }
      t.references :konkretny_ciel, null: false, foreign_key: { to_table: 'itms.konkretne_ciele' }, index: { name: 'index_itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_on_kc' }
      t.references :typ_aktivity, null: false, foreign_key: { to_table: 'itms.typy_aktivit' }, index: { name: 'index_itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_on_ta' }
      t.timestamps
    end

    create_table 'itms.vyzvy_vyhlasene_kontaktne_osoby' do |t|
      t.references :vyzva, null: false, foreign_key: { to_table: 'itms.vyzvy_vyhlasene' }
      t.references :osoba, null: false, foreign_key: { to_table: 'itms.osoby' }
      t.timestamps
    end

    create_table 'itms.vyzvy_vyhlasene_vyzvy_planovane' do |t|
      t.references :vyhlasena_vyzva, null: false, foreign_key: { to_table: 'itms.vyzvy_vyhlasene' }, index: { name: 'index_itms.vyzvy_vyhlasene_vyzvy_planovane_on_vv' }
      t.references :planovana_vyzva, null: false, foreign_key: { to_table: 'itms.vyzvy_planovane' }, index: { name: 'index_itms.vyzvy_vyhlasene_vyzvy_planovane_on_pv' }
      t.timestamps
    end

    create_table 'itms.vyzvy_vyhlasene_poskytovatelia' do |t|
      t.references :vyzva, null: false, foreign_key: { to_table: 'itms.vyzvy_vyhlasene' }
      t.references :poskytovatel, null: false, foreign_key: { to_table: 'itms.subjekty' }
      t.timestamps
    end

    create_table 'itms.vyzvy_vyhlasene_posudzovane_obdobia' do |t|
      t.references :vyzva, null: false, foreign_key: { to_table: 'itms.vyzvy_vyhlasene' }
      t.datetime :datum_uzavierky
      t.integer :poradove_cislo
      t.timestamps
    end
  end
end
