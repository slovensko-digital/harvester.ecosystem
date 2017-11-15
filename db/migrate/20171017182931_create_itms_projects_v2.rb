class CreateItmsProjectsV2 < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.projekty' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.string :akronym
      t.string :cislo_zmluvy
      #TODO t.string :data_projektu
      t.datetime :datum_konca_hlavnych_aktivit
      t.datetime :datum_konca_realizacie
      t.datetime :datum_platnosti_zmluvy
      t.datetime :datum_ucinnosti_zmluvy
      t.datetime :datum_zaciatku_hlavnych_aktivit
      t.datetime :datum_zaciatku_realizacie
      t.integer :dlzka_celkova_hlavnych_aktivit
      t.integer :dlzka_celkova_projektu
      t.string :kod
      t.string :nazov
      t.boolean :otvorena_zmena
      t.boolean :otvoreny_dodatok
      t.string :popis_projektu
      t.string :popis_situacie_po_realizacii
      t.string :popis_sposobu_realizacie
      t.string :popis_vychodiskovej_situacie
      t.string :popis_kapacity_prijimatela
      t.references :prijimatel, index: true, foreign_key: { to_table: 'itms.subjekty' }
      t.references :schvalena_zonfp, index: true, foreign_key: { to_table: 'itms.zonfp' }
      t.string :stav
      t.decimal :suma_celkova_projektov_generujucich_prijem
      t.decimal :suma_zazmluvnena
      t.decimal :suma_zazmluvnena_povodna
      t.string :url_adresa_zmluva
      t.references :vyzva, index: true, foreign_key: { to_table: 'itms.vyzvy_vyhlasene' }
      t.string :zameranie_projektu

      t.timestamps
    end

    create_table 'itms.projekty_aktivity' do |t|
      t.references :projekt, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :aktivita, index: true, foreign_key: { to_table: 'itms.aktivity' }
      t.timestamps
    end

    create_table 'itms.projekty_formy_financovania' do |t|
      t.references :projekt, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :konkretny_ciel, index: true, foreign_key: { to_table: 'itms.konkretne_ciele' }
      t.references :hodnota_ciselnika, index: true, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.timestamps
    end
    add_index 'itms.projekty_formy_financovania',
              [:projekt_id, :konkretny_ciel_id, :hodnota_ciselnika_id],
              name: 'index_itms.projekty_formy_financovania_on_p_kc_hc',
              unique: true

    create_table 'itms.projekty_hospodarske_cinnosti' do |t|
      t.references :projekt, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :konkretny_ciel, index: true, foreign_key: { to_table: 'itms.konkretne_ciele' }
      t.references :hodnota_ciselnika, index: { name: 'index_itms.projekty_hospodarske_cinnosti_on_hc' }, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.timestamps
    end
    add_index 'itms.projekty_hospodarske_cinnosti',
              [:projekt_id, :konkretny_ciel_id, :hodnota_ciselnika_id],
              name: 'index_itms.projekty_hosp_cinnosti_on_p_kc_hc',
              unique: true

    create_table 'itms.projekty_intenzity' do |t|
      t.references :projekt, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :intenzita, index: true, foreign_key: { to_table: 'itms.intenzity' }
      t.timestamps
    end
    add_index 'itms.projekty_intenzity', [:projekt_id, :intenzita_id], unique: true

    create_table 'itms.projekty_meratelne_ukazovatele' do |t|
      t.references :projekt, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.decimal :aktualny_skutocny_stav
      t.date :datum_posledneho_merania
      t.decimal :hodnota_cielova_celkova
      t.boolean :priznak_rizika
      t.references :projektovy_ukazovatel, index: { name: 'index_itms.projekty_meratelne_ukazovatele_on_ukazovatel'}, foreign_key: { to_table: 'itms.projektove_ukazovatele' }
    end
    add_index 'itms.projekty_meratelne_ukazovatele',
              [:projekt_id, :projektovy_ukazovatel_id],
              name: 'index_itms.projekty_meratelne_ukazovatele_on_projekt_ukazovatel',
              unique: true

    create_table 'itms.projekty_miesta_realizacie' do |t|
      t.references :projekt, null: false, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :miesto_realizacie, null: false, index: true, foreign_key: { to_table: 'itms.miesta_realizacie' }
    end

    create_table 'itms.projekty_miesta_realizacie_mimo_uzemia_op' do |t|
      t.references :projekt,
                   null: false,
                   index: { name: 'index_itms.projekty_miesta_realizacie_mimo_uzemia_op_on_projekt' },
                   foreign_key: { to_table: 'itms.projekty' }
      t.references :miesto_realizacie,
                   null: false,
                   index: { name: 'index_itms.projekty_miesta_realizacie_mimo_uzemia_op_on_miesto' },
                   foreign_key: { to_table: 'itms.miesta_realizacie' }
    end

    create_table 'itms.projekty_oblasti_intervencie' do |t|
      t.references :projekt, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :konkretny_ciel, index: true, foreign_key: { to_table: 'itms.konkretne_ciele' }
      t.references :hodnota_ciselnika, index: true, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.timestamps
    end
    add_index 'itms.projekty_oblasti_intervencie',
              [:projekt_id, :konkretny_ciel_id, :hodnota_ciselnika_id],
              name: 'index_itms.projekty_oblasti_intervencie_on_p_kc_hc',
              unique: true

    create_table 'itms.projekty_partneri' do |t|
      t.references :projekt, null: false, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :partner, null: false, index: true, foreign_key: { to_table: 'itms.subjekty' }
      t.timestamps
    end
    add_index 'itms.projekty_partneri', [:projekt_id, :partner_id], unique: true

    create_table 'itms.projekty_polozky_rozpoctu' do |t|
      t.references :projekt, null: false, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :polozka_rozpoctu, null: false, index: true, foreign_key: { to_table: 'itms.polozky_rozpoctu' }
      t.timestamps
    end
    add_index 'itms.projekty_polozky_rozpoctu',
              [:projekt_id, :polozka_rozpoctu_id],
              name: 'index_itms.projekty_polozky_rozpoctu_on_p_and_pr',
              unique: true

    create_table 'itms.projekty_sekundarne_tematicke_okruhy' do |t|
      t.references :projekt, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :konkretny_ciel, index: { name: 'index_itms.projekty_sekundarne_tematicke_okruhy_on_kc' }, foreign_key: { to_table: 'itms.konkretne_ciele' }
      t.references :hodnota_ciselnika, index: { name: 'index_itms.projekty_sekundarne_tematicke_okruhy_on_hc' }, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.timestamps
    end
    add_index 'itms.projekty_sekundarne_tematicke_okruhy',
              [:projekt_id, :konkretny_ciel_id, :hodnota_ciselnika_id],
              name: 'index_itms.projekty_sekundarne_tematicke_okruhy_on_p_kc_hc',
              unique: true

    create_table 'itms.projekty_typy_uzemia' do |t|
      t.references :projekt, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :konkretny_ciel, index: true, foreign_key: { to_table: 'itms.konkretne_ciele' }
      t.references :hodnota_ciselnika, index: true, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.timestamps
    end
    add_index 'itms.projekty_typy_uzemia',
              [:projekt_id, :konkretny_ciel_id, :hodnota_ciselnika_id],
              name: 'index_itms.projekty_typy_uzemia_on_p_kc_hc',
              unique: true

    create_table 'itms.projekty_uzemne_mechanizmy' do |t|
      t.references :projekt, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :konkretny_ciel, index: true, foreign_key: { to_table: 'itms.konkretne_ciele' }
      t.references :hodnota_ciselnika, index: true, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.timestamps
    end
    add_index 'itms.projekty_uzemne_mechanizmy',
              [:projekt_id, :konkretny_ciel_id, :hodnota_ciselnika_id],
              name: 'index_itms.projekty_uzemne_mechanizmy_on_p_kc_hc',
              unique: true
  end
end
