class CreateItmsProjects < ActiveRecord::Migration[5.0]
  def up
    execute 'CREATE SCHEMA itms'

    %w(ukoncene vrealizacii).each do |project_state|
      create_table "itms.projekty_#{project_state}" do |t|
        t.integer :itms_identifier, null: false, limit: 8, unique: true
        t.string :akronym
        t.string :cislo_zmluvy
        t.string :kod
        t.string :nazov
        t.string :stav
        t.datetime :created_at
        t.datetime :updated_at
        t.datetime :datum_konca_hlavnych_aktivit
        t.datetime :datum_konca_realizacie
        t.datetime :datum_platnosti_zmluvy
        t.datetime :datum_ucinnosti_zmluvy
        t.datetime :datum_zaciatku_hlavnych_aktivit
        t.datetime :datum_zaciatku_realizacie
        t.integer :dlzka_celkova_hlavnych_aktivit, limit: 8
        t.integer :dlzka_celkova_projektu, limit: 8
        t.decimal :suma_celkova_projektov_generujucich_prijem
        t.decimal :suma_zazmluvnena
        t.decimal :suma_zazmluvnena_povodna
        t.text :popis_projektu
        t.text :zameranie_projektu
      end

      create_table "itms.projekty_#{project_state}_prijimatel" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_id", null: false, limit: 8
        t.string :ine_identifikacne_cislo
        t.string :ico
      end
      add_foreign_key "itms.projekty_#{project_state}_prijimatel", "itms.projekty_#{project_state}", column: "projekty_#{project_state}_id"

      create_table "itms.projekty_#{project_state}_vyzva" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_id", null: false, limit: 8
      end
      add_foreign_key "itms.projekty_#{project_state}_vyzva", "itms.projekty_#{project_state}", column: "projekty_#{project_state}_id"

      create_table "itms.projekty_#{project_state}_aktivity" do |t|
        t.integer "projekty_#{project_state}_id", null: false, limit: 8
        t.string :datum_konca_planovany
        t.string :datum_konca_skutocny
        t.string :datum_zaciatku_planovany
        t.string :datum_zaciatku_skutocny
        t.string :kod
        t.string :nazov
      end
      add_foreign_key "itms.projekty_#{project_state}_aktivity", "itms.projekty_#{project_state}", column: "projekty_#{project_state}_id"

      create_table "itms.projekty_#{project_state}_aktivity_subjekty" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_aktivity_id", null: false, limit: 8
        t.string :ico
        t.string :ine_identifikacne_cislo
      end
      add_foreign_key "itms.projekty_#{project_state}_aktivity_subjekty", "itms.projekty_#{project_state}_aktivity", column: "projekty_#{project_state}_aktivity_id"

      create_table "itms.projekty_#{project_state}_formy_financovania" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_id", null: false, limit: 8
        t.string :kod_zdroj
        t.string :nazov
      end
      add_foreign_key "itms.projekty_#{project_state}_formy_financovania", "itms.projekty_#{project_state}", column: "projekty_#{project_state}_id"

      create_table "itms.projekty_#{project_state}_formy_financovania_ciele" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_formy_financovania_id", null: false, limit: 8
      end
      add_foreign_key "itms.projekty_#{project_state}_formy_financovania_ciele", "itms.projekty_#{project_state}_formy_financovania", column: "projekty_#{project_state}_formy_financovania_id"

      create_table "itms.projekty_#{project_state}_hospodarske_cinnosti" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_id", null: false, limit: 8
        t.string :kod_zdroj
        t.string :nazov
      end
      add_foreign_key "itms.projekty_#{project_state}_hospodarske_cinnosti", "itms.projekty_#{project_state}", column: "projekty_#{project_state}_id"

      create_table "itms.projekty_#{project_state}_hospodarske_cinnosti_ciele" do  |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_hospodarske_cinnosti_id", null: false, limit: 8
      end
      add_foreign_key "itms.projekty_#{project_state}_hospodarske_cinnosti_ciele", "itms.projekty_#{project_state}_hospodarske_cinnosti", column: "projekty_#{project_state}_hospodarske_cinnosti_id"

      create_table "itms.projekty_#{project_state}_intenzity" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_id", null: false, limit: 8
        t.string :nazov
      end
      add_foreign_key "itms.projekty_#{project_state}_intenzity", "itms.projekty_#{project_state}", column: "projekty_#{project_state}_id"

      create_table "itms.projekty_#{project_state}_intenzity_subjekty" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_intenzity_id", null: false, limit: 8
        t.string :ico
        t.string :ine_identifikacne_cislo
      end
      add_foreign_key "itms.projekty_#{project_state}_intenzity_subjekty", "itms.projekty_#{project_state}_intenzity", column: "projekty_#{project_state}_intenzity_id"

      create_table "itms.projekty_#{project_state}_intenzity_zdroje" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_intenzity_id", null: false, limit: 8
        t.decimal :cerpanie_eu
        t.decimal :cerpanie_ro
        t.decimal :percento
        t.decimal :suma_zazmluvnena
        t.string :typ
        t.string :kod
        t.string :nazov
      end
      add_foreign_key "itms.projekty_#{project_state}_intenzity_zdroje", "itms.projekty_#{project_state}_intenzity", column: "projekty_#{project_state}_intenzity_id"

      create_table "itms.projekty_#{project_state}_meratelne_ukazovatele" do |t|
        t.integer "projekty_#{project_state}_id", null: false, limit: 8
        t.decimal :aktualny_skutocny_stav
        t.decimal :hodnota_cielova_celkova
        t.string :kod
        t.string :merna_jednotka
        t.string :nazov
      end
      add_foreign_key "itms.projekty_#{project_state}_meratelne_ukazovatele", "itms.projekty_#{project_state}", column: "projekty_#{project_state}_id"

      create_table "itms.projekty_#{project_state}_miesta_realizacie" do |t|
        t.integer "projekty_#{project_state}_id", null: false, limit: 8
      end
      add_foreign_key "itms.projekty_#{project_state}_miesta_realizacie", "itms.projekty_#{project_state}", column: "projekty_#{project_state}_id"

      create_table "itms.projekty_#{project_state}_miesta_realizacie_units" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_miesta_realizacie_id", null: false, limit: 8
        t.string :typ
        t.string :nazov
      end
      add_foreign_key "itms.projekty_#{project_state}_miesta_realizacie_units", "itms.projekty_#{project_state}_miesta_realizacie", column: "projekty_#{project_state}_miesta_realizacie_id"

      create_table "itms.projekty_#{project_state}_monitorovacie_terminy" do |t|
        t.integer "projekty_#{project_state}_id", null: false, limit: 8
        t.string :datum_predlozenia_najneskorsi
        t.string :termin_monitorovania
        t.string :typ_monitorovacej_spravy
        t.integer :poradove_cislo, limit: 8
      end
      add_foreign_key "itms.projekty_#{project_state}_monitorovacie_terminy", "itms.projekty_#{project_state}", column: "projekty_#{project_state}_id"

      create_table "itms.projekty_#{project_state}_oblasti_intervencie" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_id", null: false, limit: 8
        t.string :kod_zdroj
        t.string :nazov
      end
      add_foreign_key "itms.projekty_#{project_state}_oblasti_intervencie", "itms.projekty_#{project_state}", column: "projekty_#{project_state}_id"

      create_table "itms.projekty_#{project_state}_oblasti_intervencie_ciele" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_oblasti_intervencie_id", null: false, limit: 8
      end
      add_foreign_key "itms.projekty_#{project_state}_oblasti_intervencie_ciele",  "itms.projekty_#{project_state}_oblasti_intervencie", column:  "projekty_#{project_state}_oblasti_intervencie_id"

      create_table "itms.projekty_#{project_state}_organizacne_zlozky" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_id", null: false, limit: 8
        t.string :adresa
        t.string :nazov
      end
      add_foreign_key "itms.projekty_#{project_state}_organizacne_zlozky", "itms.projekty_#{project_state}", column: "projekty_#{project_state}_id"

      create_table "itms.projekty_#{project_state}_partneri" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_id", null: false, limit: 8
        t.string :ico
        t.string :ine_identifikacne_cislo
      end
      add_foreign_key "itms.projekty_#{project_state}_partneri", "itms.projekty_#{project_state}", column: "projekty_#{project_state}_id"

      create_table "itms.projekty_#{project_state}_typy_uzemia" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_id", null: false, limit: 8
        t.string :kod_zdroj
        t.string :nazov
      end
      add_foreign_key "itms.projekty_#{project_state}_typy_uzemia", "itms.projekty_#{project_state}", column: "projekty_#{project_state}_id"

      create_table "itms.projekty_#{project_state}_typy_uzemia_ciele" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_typy_uzemia_id", null: false, limit: 8
      end
      add_foreign_key "itms.projekty_#{project_state}_typy_uzemia_ciele", "itms.projekty_#{project_state}_typy_uzemia", column:  "projekty_#{project_state}_typy_uzemia_id"

      create_table "itms.projekty_#{project_state}_uzemne_mechanizmy" do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_id", null: false, limit: 8
        t.string :kod_zdroj
        t.string :nazov
      end
      add_foreign_key "itms.projekty_#{project_state}_uzemne_mechanizmy", "itms.projekty_#{project_state}", column: "projekty_#{project_state}_id"

      create_table "itms.projekty_#{project_state}_uzemne_mechanizmy_ciele"  do |t|
        t.integer :itms_identifier, null: false, limit: 8
        t.integer "projekty_#{project_state}_uzemne_mechanizmy_id", null: false, limit: 8
      end
      add_foreign_key "itms.projekty_#{project_state}_uzemne_mechanizmy_ciele", "itms.projekty_#{project_state}_uzemne_mechanizmy", column: "projekty_#{project_state}_uzemne_mechanizmy_id"
    end
  end

  def down
    execute 'DROP SCHEMA itms CASCADE'
  end
end
