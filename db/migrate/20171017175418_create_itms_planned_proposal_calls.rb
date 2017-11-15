class CreateItmsPlannedProposalCalls < ActiveRecord::Migration[5.0]
  def change
    drop_table 'itms.vyzvy_planovane', force: :cascade
    drop_table 'itms.vyzvy_planovane_ciele', force: :cascade
    drop_table 'itms.vyzvy_planovane_doplnujuce_info', force: :cascade
    drop_table 'itms.vyzvy_planovane_poskytovatelia', force: :cascade
    drop_table 'itms.vyzvy_planovane_vyhlasovatel', force: :cascade

    create_table 'itms.vyzvy_planovane' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.decimal :alokacia_eu
      t.decimal :alokacia_sr
      t.datetime :datum_uzavretia_1_kolo
      t.datetime :datum_uzavretia_2_kolo
      t.datetime :datum_vyhlasenia_1_kolo
      t.datetime :datum_vyhlasenia_2_kolo
      t.string :druh
      t.string :kod
      t.string :nazov
      t.string :stav
      t.string :typ_1_kolo
      t.string :typ_2_kolo
      t.references :vyhlasovatel, index: true, foreign_key: { to_table: 'itms.subjekty' }

      t.timestamps
    end

    create_table 'itms.vyzvy_planovane_doplnujuce_info' do |t|
      t.references :vyzva, null: false, foreign_key: { to_table: 'itms.vyzvy_planovane' }
      t.string :nazov
      t.string :url
      t.timestamps
    end

    create_table 'itms.vyzvy_planovane_konkretne_ciele' do |t|
      t.references :vyzva, null: false, foreign_key: { to_table: 'itms.vyzvy_planovane' }
      t.references :konkretny_ciel, null: false, foreign_key: { to_table: 'itms.konkretne_ciele' }
      t.timestamps
    end

    create_table 'itms.vyzvy_planovane_poskytovatelia' do |t|
      t.references :vyzva, null: false, foreign_key: { to_table: 'itms.vyzvy_planovane' }
      t.references :poskytovatel, null: false, index: true, foreign_key: { to_table: 'itms.subjekty' }
      t.timestamps
    end
  end
end
