class CreateItmsAppeals < ActiveRecord::Migration[5.0]

  APPEAL_STATES = %w(planovane vyhlasene)

  def up
    APPEAL_STATES.each do |appeal_state|
      create_table "itms.vyzvy_#{appeal_state}" do |t|
        t.integer :itms_identifier, null: false, limit: 8, unique: true
        t.string :druh
        t.string :kod
        t.string :nazov
        t.string :stav
        t.string :typ
        t.decimal :alokacia_eu
        t.decimal :alokacia_sr
        t.datetime :updated_at
        t.datetime :created_at
        t.boolean :technicka_asistencia
      end

      create_table "itms.vyzvy_#{appeal_state}_doplnujuce_info" do |t|
        t.integer "vyzvy_#{appeal_state}_id", null: false, limit: 8
        t.string :nazov
        t.string :url
      end
      add_foreign_key "itms.vyzvy_#{appeal_state}_doplnujuce_info", "itms.vyzvy_#{appeal_state}", column: "vyzvy_#{appeal_state}_id"

      create_table "itms.vyzvy_#{appeal_state}_ciele" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "vyzvy_#{appeal_state}_id", null: false, limit: 8
      end
      add_foreign_key "itms.vyzvy_#{appeal_state}_ciele", "itms.vyzvy_#{appeal_state}", column: "vyzvy_#{appeal_state}_id"

      create_table "itms.vyzvy_#{appeal_state}_poskytovatelia" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "vyzvy_#{appeal_state}_id", null: false, limit: 8
        t.string :ico
        t.string :ine_identifikacne_cislo
      end
      add_foreign_key "itms.vyzvy_#{appeal_state}_poskytovatelia", "itms.vyzvy_#{appeal_state}", column: "vyzvy_#{appeal_state}_id"

      create_table "itms.vyzvy_#{appeal_state}_vyhlasovatel" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "vyzvy_#{appeal_state}_id", null: false, limit: 8
        t.string :ico
        t.string :ine_identifikacne_cislo
      end
      add_foreign_key "itms.vyzvy_#{appeal_state}_vyhlasovatel", "itms.vyzvy_#{appeal_state}", column: "vyzvy_#{appeal_state}_id"
    end

    create_table 'itms.vyzvy_vyhlasene_fondy' do |t|
      t.integer :vyzvy_vyhlasene_id, null: false, limit: 8
      t.string :nazov
    end
    add_foreign_key 'itms.vyzvy_vyhlasene_fondy', 'itms.vyzvy_vyhlasene', column: 'vyzvy_vyhlasene_id'

    create_table 'itms.vzvy_vyhlasene_kontaktne_osoby' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :vyzvy_vyhlasene_id, null: false, limit: 8
      t.string :email
      t.string :meno
      t.string :meno_uplne
      t.string :priezvisko
      t.string :telefon
    end
    add_foreign_key 'itms.vzvy_vyhlasene_kontaktne_osoby', 'itms.vyzvy_vyhlasene', column: 'vyzvy_vyhlasene_id'

    create_table 'itms.vzvy_vyhlasene_planovane_vyzvy' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :vyzvy_vyhlasene_id, null: false, limit: 8
    end
    add_foreign_key 'itms.vzvy_vyhlasene_planovane_vyzvy', 'itms.vyzvy_vyhlasene', column: 'vyzvy_vyhlasene_id'

    create_table 'itms.vzvy_vyhlasene_posudzovane_obdobia' do |t|
      t.integer :vyzvy_vyhlasene_id, null: false, limit: 8
      t.string :datum_uzavierky
      t.integer :poradove_cislo, limit: 8
    end
    add_foreign_key 'itms.vzvy_vyhlasene_posudzovane_obdobia', 'itms.vyzvy_vyhlasene', column: 'vyzvy_vyhlasene_id'

    add_column 'itms.vyzvy_planovane', :typ1_kolo, :string
    add_column 'itms.vyzvy_planovane', :typ2_kolo, :string
    add_column 'itms.vyzvy_planovane', :datum_uzavretia1_kolo, :datetime
    add_column 'itms.vyzvy_planovane', :datum_uzavretia2_kolo, :datetime
    add_column 'itms.vyzvy_planovane', :datum_vyhlasenia1_kolo, :datetime
    add_column 'itms.vyzvy_planovane', :datum_vyhlasenia2_kolo, :datetime

    add_column 'itms.vyzvy_vyhlasene', :datum_uzavretia, :datetime
    add_column 'itms.vyzvy_vyhlasene', :datum_vyhlasenia, :datetime
  end

  def down
    APPEAL_STATES.each do |appeal_state|
      drop_table "itms.vyzvy_#{appeal_state}"
      drop_table "itms.vyzvy_#{appeal_state}_doplnujuce_info"
      drop_table "itms.vyzvy_#{appeal_state}_ciele"
      drop_table "itms.vyzvy_#{appeal_state}_poskytovatelia"
      drop_table "itms.vyzvy_#{appeal_state}_vyhlasovatel"
    end

    drop_table 'itms.vyzvy_vyhlasene_fondy'
    drop_table 'itms.vzvy_vyhlasene_kontaktne_osoby'
    drop_table 'itms.vzvy_vyhlasene_planovane_vyzvy'
    drop_table 'itms.vzvy_vyhlasene_posudzovane_obdobia'
  end
end
