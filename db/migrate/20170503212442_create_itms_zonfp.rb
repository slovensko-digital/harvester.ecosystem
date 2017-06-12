class CreateItmsZonfp < ActiveRecord::Migration[5.0]

  ZONFP_STATES = %w(prijate schvalene zamietnute)

  def up
    ZONFP_STATES.each do |zonfp_state|
      create_table "itms.zonfp_#{zonfp_state}" do |t|
        t.integer :itms_identifier, null: false, limit: 8, unique: true
        t.string :akronym
        t.string :kod
        t.string :nazov
        t.string :zameranie_projektu
        t.text :popis_projektu
        t.datetime :updated_at
        t.datetime :created_at
      end

      create_table "itms.zonfp_#{zonfp_state}_aktivity_projekty" do |t|
        t.integer "zonfp_#{zonfp_state}_id", null: false, limit: 8
        t.string :kod
        t.string :nazov
        t.string :datum_konca_planovany
        t.string :datum_konca_skutocny
        t.string :datum_zaciatku_planovany
        t.string :datum_zaciatku_skutocny
      end
      add_foreign_key "itms.zonfp_#{zonfp_state}_aktivity_projekty", "itms.zonfp_#{zonfp_state}", column: "zonfp_#{zonfp_state}_id"

      create_table "itms.zonfp_#{zonfp_state}_aktivity_projekt_subjekty" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zonfp_#{zonfp_state}_aktivity_projekty_id", null: false, limit: 8
        t.string :ico
        t.string :dic
        t.string :ine_identifikacne_cislo
      end
      add_foreign_key "itms.zonfp_#{zonfp_state}_aktivity_projekt_subjekty", "itms.zonfp_#{zonfp_state}_aktivity_projekty", column: "zonfp_#{zonfp_state}_aktivity_projekty_id"

      create_table "itms.zonfp_#{zonfp_state}_formy_financovania" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zonfp_#{zonfp_state}_id", null: false, limit: 8
        t.string :kod_zdroj
        t.string :nazov
      end
      add_foreign_key "itms.zonfp_#{zonfp_state}_formy_financovania", "itms.zonfp_#{zonfp_state}", column: "zonfp_#{zonfp_state}_id"

      create_table "itms.zonfp_#{zonfp_state}_formy_financovania_ciele" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zonfp_#{zonfp_state}_formy_financovania_id", null: false, limit: 8
      end
      add_foreign_key "itms.zonfp_#{zonfp_state}_formy_financovania_ciele", "itms.zonfp_#{zonfp_state}_formy_financovania", column: "zonfp_#{zonfp_state}_formy_financovania_id"

      create_table "itms.zonfp_#{zonfp_state}_hospodarske_cinnosti" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zonfp_#{zonfp_state}_id", null: false, limit: 8
        t.string :kod_zdroj
        t.string :nazov
      end
      add_foreign_key "itms.zonfp_#{zonfp_state}_hospodarske_cinnosti", "itms.zonfp_#{zonfp_state}", column: "zonfp_#{zonfp_state}_id"

      create_table "itms.zonfp_#{zonfp_state}_hospodarske_cinnosti_ciele" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zonfp_#{zonfp_state}_hospodarske_cinnosti_id", null: false, limit: 8
      end
      add_foreign_key  "itms.zonfp_#{zonfp_state}_hospodarske_cinnosti_ciele", "itms.zonfp_#{zonfp_state}_hospodarske_cinnosti", column:  "zonfp_#{zonfp_state}_hospodarske_cinnosti_id"

      create_table "itms.zonfp_#{zonfp_state}_meratelne_ukazovatele" do |t|
        t.integer "zonfp_#{zonfp_state}_id", null: false, limit: 8
        t.string :kod
        t.string :merna_jednotka
        t.string :nazov
        t.decimal :aktualny_skutocny_stav
        t.decimal :hodnota_cielova_celkova
      end
      add_foreign_key "itms.zonfp_#{zonfp_state}_meratelne_ukazovatele", "itms.zonfp_#{zonfp_state}", column: "zonfp_#{zonfp_state}_id"

      create_table "itms.zonfp_#{zonfp_state}_miesta_realizacie" do |t|
        t.integer "zonfp_#{zonfp_state}_id", null: false, limit: 8
      end
      add_foreign_key "itms.zonfp_#{zonfp_state}_miesta_realizacie", "itms.zonfp_#{zonfp_state}", column: "zonfp_#{zonfp_state}_id"

      create_table "itms.zonfp_#{zonfp_state}_miesta_realizacie_units" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zonfp_#{zonfp_state}_miesta_realizacie_id", null: false, limit: 8
        t.string :typ
        t.string :nazov
      end
      add_foreign_key "itms.zonfp_#{zonfp_state}_miesta_realizacie_units","itms.zonfp_#{zonfp_state}_miesta_realizacie", column:  "zonfp_#{zonfp_state}_miesta_realizacie_id"

      create_table "itms.zonfp_#{zonfp_state}_oblasti_intervencie" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zonfp_#{zonfp_state}_id", null: false, limit: 8
        t.string :kod_zdroj
        t.string :nazov
      end
      add_foreign_key "itms.zonfp_#{zonfp_state}_oblasti_intervencie", "itms.zonfp_#{zonfp_state}", column: "zonfp_#{zonfp_state}_id"

      create_table "itms.zonfp_#{zonfp_state}_oblasti_intervencie_ciele" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zonfp_#{zonfp_state}_oblasti_intervencie_id", null: false, limit: 8
      end
      add_foreign_key  "itms.zonfp_#{zonfp_state}_oblasti_intervencie_ciele", "itms.zonfp_#{zonfp_state}_oblasti_intervencie", column: "zonfp_#{zonfp_state}_oblasti_intervencie_id"

      create_table "itms.zonfp_#{zonfp_state}_organizacne_zlozky" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zonfp_#{zonfp_state}_id", null: false, limit: 8
        t.string :adresa
        t.string :nazov
      end
      add_foreign_key "itms.zonfp_#{zonfp_state}_organizacne_zlozky", "itms.zonfp_#{zonfp_state}", column: "zonfp_#{zonfp_state}_id"

      create_table "itms.zonfp_#{zonfp_state}_partneri" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zonfp_#{zonfp_state}_id", null: false, limit: 8
        t.string :ico
        t.string :dic
        t.string :ine_identifikacne_cislo
      end
      add_foreign_key "itms.zonfp_#{zonfp_state}_partneri", "itms.zonfp_#{zonfp_state}", column: "zonfp_#{zonfp_state}_id"

      create_table "itms.zonfp_#{zonfp_state}_typy_uzemia" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zonfp_#{zonfp_state}_id", null: false, limit: 8
        t.string :kod_zdroj
        t.string :nazov
      end
      add_foreign_key "itms.zonfp_#{zonfp_state}_typy_uzemia", "itms.zonfp_#{zonfp_state}", column: "zonfp_#{zonfp_state}_id"

      create_table "itms.zonfp_#{zonfp_state}_typy_uzemia_ciele" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zonfp_#{zonfp_state}_typy_uzemia_id", null: false, limit: 8
      end
      add_foreign_key "itms.zonfp_#{zonfp_state}_typy_uzemia_ciele", "itms.zonfp_#{zonfp_state}_typy_uzemia", column: "zonfp_#{zonfp_state}_typy_uzemia_id"

      create_table "itms.zonfp_#{zonfp_state}_uzemne_mechanizmy" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zonfp_#{zonfp_state}_id", null: false, limit: 8
        t.string :kod_zdroj
        t.string :nazov
      end
      add_foreign_key "itms.zonfp_#{zonfp_state}_uzemne_mechanizmy", "itms.zonfp_#{zonfp_state}", column: "zonfp_#{zonfp_state}_id"

      create_table "itms.zonfp_#{zonfp_state}_uzemne_mechanizmy_ciele" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zonfp_#{zonfp_state}_uzemne_mechanizmy_id", null: false, limit: 8
      end
      add_foreign_key "itms.zonfp_#{zonfp_state}_uzemne_mechanizmy_ciele", "itms.zonfp_#{zonfp_state}_uzemne_mechanizmy", column: "zonfp_#{zonfp_state}_uzemne_mechanizmy_id"

      create_table "itms.zonfp_#{zonfp_state}_vyzvy" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zonfp_#{zonfp_state}_id", null: false, limit: 8
      end
      add_foreign_key "itms.zonfp_#{zonfp_state}_vyzvy", "itms.zonfp_#{zonfp_state}", column: "zonfp_#{zonfp_state}_id"

      create_table "itms.zonfp_#{zonfp_state}_ziadatel" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "zonfp_#{zonfp_state}_id", null: false, limit: 8
        t.string :ico
        t.string :dic
        t.string :ine_identifikacne_cislo
      end
      add_foreign_key "itms.zonfp_#{zonfp_state}_ziadatel", "itms.zonfp_#{zonfp_state}", column: "zonfp_#{zonfp_state}_id"
    end

    add_column 'itms.zonfp_prijate', :datum_predlozenia, :datetime
    add_column 'itms.zonfp_prijate', :datum_ziadany_konca_hlavnych_aktivit, :datetime
    add_column 'itms.zonfp_prijate', :datum_ziadany_konca_realizacie, :datetime
    add_column 'itms.zonfp_prijate', :datum_ziadany_zaciatku_hlavnych_aktivit, :datetime
    add_column 'itms.zonfp_prijate', :datum_ziadany_zaciatku_realizacie, :datetime
    add_column 'itms.zonfp_prijate', :percento_ziadane_spolufinancovania, :decimal
    add_column 'itms.zonfp_prijate', :suma_ziadana_celkova, :decimal
    add_column 'itms.zonfp_prijate', :suma_ziadana_celkova_projektov_generujucich_prijem, :decimal
    add_column 'itms.zonfp_prijate', :suma_ziadana_nfp, :decimal
    add_column 'itms.zonfp_prijate', :suma_ziadana_vlastnych_zdrojov, :decimal

    add_column 'itms.zonfp_schvalene', :datum_schvalenia, :datetime
    add_column 'itms.zonfp_schvalene', :datum_schvaleny_konca_hlavnych_aktivit, :datetime
    add_column 'itms.zonfp_schvalene', :datum_schvaleny_konca_realizacie, :datetime
    add_column 'itms.zonfp_schvalene', :datum_schvaleny_zaciatku_hlavnych_aktivit, :datetime
    add_column 'itms.zonfp_schvalene', :datum_schvaleny_zaciatku_realizacie, :datetime
    add_column 'itms.zonfp_schvalene', :percento_schvalene_spolufinancovania, :decimal
    add_column 'itms.zonfp_schvalene', :pocet_bodov_hodnotenia_celkovy, :decimal
    add_column 'itms.zonfp_schvalene', :suma_schvalena_celkova, :decimal
    add_column 'itms.zonfp_schvalene', :suma_schvalena_celkova_projektov_generujucich_prijem, :decimal
    add_column 'itms.zonfp_schvalene', :suma_schvalena_nfp, :decimal
    add_column 'itms.zonfp_schvalene', :suma_schvalena_vlastnych_zdrojov, :decimal

    create_table 'itms.zonfp_schvalene_hodnotitelia' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :zonfp_schvalene_id, null: false, limit: 8
      t.string :email
      t.string :meno
      t.string :meno_uplne
      t.string :priezvisko
      t.string :telefon
    end
    add_foreign_key 'itms.zonfp_schvalene_hodnotitelia', 'itms.zonfp_schvalene', column: 'zonfp_schvalene_id'

    add_column 'itms.zonfp_zamietnute', :datum_zamietnutia, :datetime
    add_column 'itms.zonfp_zamietnute', :datum_ziadany_konca_hlavnych_aktivit, :datetime
    add_column 'itms.zonfp_zamietnute', :datum_ziadany_konca_realizacie, :datetime
    add_column 'itms.zonfp_zamietnute', :datum_ziadany_zaciatku_hlavnych_aktivit, :datetime
    add_column 'itms.zonfp_zamietnute', :datum_ziadany_zaciatku_realizacie, :datetime
    add_column 'itms.zonfp_zamietnute', :percento_ziadane_spolufinancovania, :decimal
    add_column 'itms.zonfp_zamietnute', :suma_ziadana_celkova, :decimal
    add_column 'itms.zonfp_zamietnute', :suma_ziadana_celkova_projektov_generujucich_prijem, :decimal
    add_column 'itms.zonfp_zamietnute', :suma_ziadana_nfp, :decimal
    add_column 'itms.zonfp_zamietnute', :suma_ziadana_vlastnych_zdrojov, :decimal

    create_table 'itms.zonfp_zamietnute_vysledok_konania' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :zonfp_zamietnute_id, null: false, limit: 8
      t.string :kod_zdroj
      t.string :nazov
    end
    add_foreign_key 'itms.zonfp_zamietnute_vysledok_konania', 'itms.zonfp_zamietnute', column: 'zonfp_zamietnute_id'
  end

  def down
    drop_table 'itms.zonfp_schvalene_hodnotitelia'
    drop_table 'itms.zonfp_zamietnute_vysledok_konania'

    ZONFP_STATES.each do |zonfp_state|
      drop_table "itms.zonfp_#{zonfp_state}_aktivity_projekt_subjekty"
      drop_table "itms.zonfp_#{zonfp_state}_aktivity_projekty"
      drop_table "itms.zonfp_#{zonfp_state}_formy_financovania_ciele"
      drop_table "itms.zonfp_#{zonfp_state}_formy_financovania"
      drop_table "itms.zonfp_#{zonfp_state}_hospodarske_cinnosti_ciele"
      drop_table "itms.zonfp_#{zonfp_state}_hospodarske_cinnosti"
      drop_table "itms.zonfp_#{zonfp_state}_meratelne_ukazovatele"
      drop_table "itms.zonfp_#{zonfp_state}_miesta_realizacie_units"
      drop_table "itms.zonfp_#{zonfp_state}_miesta_realizacie"
      drop_table "itms.zonfp_#{zonfp_state}_oblasti_intervencie_ciele"
      drop_table "itms.zonfp_#{zonfp_state}_oblasti_intervencie"
      drop_table "itms.zonfp_#{zonfp_state}_organizacne_zlozky"
      drop_table "itms.zonfp_#{zonfp_state}_partneri"
      drop_table "itms.zonfp_#{zonfp_state}_typy_uzemia_ciele"
      drop_table "itms.zonfp_#{zonfp_state}_typy_uzemia"
      drop_table "itms.zonfp_#{zonfp_state}_uzemne_mechanizmy_ciele"
      drop_table "itms.zonfp_#{zonfp_state}_uzemne_mechanizmy"
      drop_table "itms.zonfp_#{zonfp_state}_vyzvy"
      drop_table "itms.zonfp_#{zonfp_state}_ziadatel"
      drop_table "itms.zonfp_#{zonfp_state}"
    end
  end
end
