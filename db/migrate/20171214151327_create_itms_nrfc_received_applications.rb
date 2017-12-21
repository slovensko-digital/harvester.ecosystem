class CreateItmsNrfcReceivedApplications < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.zonfp_prijate' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.string :akronym
      t.datetime :datum_predlozenia
      t.datetime :datum_ziadany_konca_hlavnych_aktivit
      t.datetime :datum_ziadany_konca_realizacie
      t.datetime :datum_ziadany_zaciatku_hlavnych_aktivit
      t.datetime :datum_ziadany_zaciatku_realizacie
      t.string :kod
      t.string :nazov
      t.decimal :percento_ziadane_spolufinancovania
      t.string :popis_projektu
      t.decimal :suma_ziadana_celkova
      t.decimal :suma_ziadana_celkova_projektov_generujucich_prijem
      t.decimal :suma_ziadana_nfp
      t.decimal :suma_ziadana_vlastnych_zdrojov
      t.references :vyzva, foreign_key: { to_table: 'itms.vyzvy_vyhlasene' }
      t.string :zameranie_projektu
      t.references :ziadatel, foreign_key: { to_table: 'itms.subjekty' }
      t.timestamps
    end

    create_table 'itms.zonfp_prijate_aktivity_projekt' do |t|
      t.references :zonfp, null: false, foreign_key: { to_table: 'itms.zonfp_prijate' }, index: true

      t.datetime :datum_konca_planovany
      t.datetime :datum_konca_schvaleny
      t.datetime :datum_zaciatku_planovany
      t.datetime :datum_zaciatku_schvaleny
      t.string :kod
      t.string :nazov
      t.references :subjekt, foreign_key: { to_table: 'itms.subjekty' }
      t.references :typ_aktivity, foreign_key: { to_table: 'itms.typy_aktivit' }
      t.timestamps
    end

    create_table 'itms.zonfp_prijate_formy_financovania' do |t|
      t.references :zonfp, null: false, foreign_key: { to_table: 'itms.zonfp_prijate' }, index: true
      t.references :forma_financovania, null: false, foreign_key: { to_table: 'itms.konkretne_ciele_hodnoty_ciselnikov' }, index: { name: 'index_itms.zonfp_prijate_formy_financovania_on_ff' }
      t.timestamps
    end
    add_index 'itms.zonfp_prijate_formy_financovania', [:zonfp_id, :forma_financovania_id], unique: true, name: 'index_itms.zonfp_prijate_formy_financovania_on_z_and_ff'

    create_table 'itms.zonfp_prijate_hospodarske_cinnosti' do |t|
      t.references :zonfp, null: false, foreign_key: { to_table: 'itms.zonfp_prijate' }, index: true
      t.references :hospodarska_cinnost, null: false, foreign_key: { to_table: 'itms.konkretne_ciele_hodnoty_ciselnikov' }, index: { name: 'index_itms.zonfp_prijate_hospodarske_cinnosti_on_hc' }
      t.timestamps
    end
    add_index 'itms.zonfp_prijate_hospodarske_cinnosti', [:zonfp_id, :hospodarska_cinnost_id], unique: true, name: 'index_itms.zonfp_prijate_hospodarske_cinnosti_on_z_and_hc'

    create_table 'itms.zonfp_prijate_meratelne_ukazovatele' do |t|
      t.references :zonfp, null: false, foreign_key: { to_table: 'itms.zonfp_prijate' }, index: true

      t.decimal :aktualny_skutocny_stav
      t.date :datum_posledneho_merania
      t.decimal :hodnota_cielova_celkova
      t.boolean :priznak_rizika
      t.references :projektovy_ukazovatel,
                   null: false,
                   index: { name: 'index_itms.zonfp_prijate_meratelne_ukazovatele_on_ukazovatel'},
                   foreign_key: { to_table: 'itms.projektove_ukazovatele' }
    end
    add_index 'itms.zonfp_prijate_meratelne_ukazovatele',
              [:zonfp_id, :projektovy_ukazovatel_id],
              name: 'index_itms.zonfp_prijate_meratelne_ukazovatele_on_z_and_mu',
              unique: true

    create_table 'itms.zonfp_prijate_miesta_realizacie' do |t|
      t.references :zonfp, null: false, foreign_key: { to_table: 'itms.zonfp_prijate' }, index: true
      t.references :miesto_realizacie, null: false, foreign_key: { to_table: 'itms.miesta_realizacie' }, index: { name: 'index_itms.zonfp_prijate_miesta_realizacie_on_mr' }
      t.timestamps
    end
    add_index 'itms.zonfp_prijate_miesta_realizacie', [:zonfp_id, :miesto_realizacie_id], unique: true, name: 'index_itms.zonfp_prijate_miesta_realizacie_on_z_and_mr'

    create_table 'itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op' do |t|
      t.references :zonfp, null: false, foreign_key: { to_table: 'itms.zonfp_prijate' }, index: { name: 'index_itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op_on_z' }
      t.references :miesto_realizacie, null: false, foreign_key: { to_table: 'itms.miesta_realizacie' }, index: { name: 'index_itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op_on_mr' }
      t.timestamps
    end
    add_index 'itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op', [:zonfp_id, :miesto_realizacie_id], unique: true, name: 'index_itms.zonfp_prijate_miesta_realizacie_mimo_op_on_z_and_mr'

    create_table 'itms.zonfp_prijate_oblasti_intervencie' do |t|
      t.references :zonfp, null: false, foreign_key: { to_table: 'itms.zonfp_prijate' }, index: true
      t.references :oblast_intervencie, null: false, foreign_key: { to_table: 'itms.konkretne_ciele_hodnoty_ciselnikov' }, index: { name: 'index_itms.zonfp_prijate_oblasti_intervencie_on_oi' }
      t.timestamps
    end
    add_index 'itms.zonfp_prijate_oblasti_intervencie', [:zonfp_id, :oblast_intervencie_id], unique: true, name: 'index_itms.zonfp_prijate_oblasti_intervencie_on_z_and_oi'

    create_table 'itms.zonfp_prijate_organizacne_zlozky' do |t|
      t.references :zonfp, null: false, foreign_key: { to_table: 'itms.zonfp_prijate' }, index: true
      t.references :organizacna_zlozka, null: false, foreign_key: { to_table: 'itms.organizacne_zlozky' },  index: { name: 'index_itms.zonfp_prijate_organizacne_zlozky_on_oz' }
      t.timestamps
    end
    add_index 'itms.zonfp_prijate_organizacne_zlozky', [:zonfp_id, :organizacna_zlozka_id], unique: true, name: 'index_itms.zonfp_prijate_organizacne_zlozky_on_z_and_oz'

    create_table 'itms.zonfp_prijate_partneri' do |t|
      t.references :zonfp, null: false, foreign_key: { to_table: 'itms.zonfp_prijate' }, index: true
      t.references :partner, null: false, foreign_key: { to_table: 'itms.subjekty' }, index: true
      t.timestamps
    end
    add_index 'itms.zonfp_prijate_partneri', [:zonfp_id, :partner_id], unique: true

    create_table 'itms.zonfp_prijate_polozky_rozpoctu' do |t|
      t.references :zonfp, null: false, foreign_key: { to_table: 'itms.zonfp_prijate' }, index: true
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :aktivita_zonfp_kod
      t.references :skupina_vydavkov, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }, index: { name: 'index_itms.zonfp_prijate_polozky_rozpoctu_on_sv' }
      t.decimal :suma_opravneneho_vydavku
    end

    create_table 'itms.zonfp_prijate_sekundarne_tematicke_okruhy' do |t|
      t.references :zonfp, null: false, foreign_key: { to_table: 'itms.zonfp_prijate' }, index: { name: 'index_itms.zonfp_prijate_sekundarne_tematicke_okruhy_on_zp' }
      t.references :sekundarny_tematicky_okruh,
                   null: false,
                   foreign_key: { to_table: 'itms.konkretne_ciele_hodnoty_ciselnikov' },
                   index: { name: 'index_itms.zonfp_prijate_sekundarne_tematicke_okruhy_on_sto' }
      t.timestamps
    end
    add_index 'itms.zonfp_prijate_sekundarne_tematicke_okruhy', [:zonfp_id, :sekundarny_tematicky_okruh_id], unique: true, name: 'index_itms.zonfp_prijate_sto_on_z_and_sto'

    create_table 'itms.zonfp_prijate_typy_uzemia' do |t|
      t.references :zonfp, null: false, foreign_key: { to_table: 'itms.zonfp_prijate' }, index: true
      t.references :typ_uzemia, null: false, foreign_key: { to_table: 'itms.konkretne_ciele_hodnoty_ciselnikov' }, index: true
      t.timestamps
    end
    add_index 'itms.zonfp_prijate_typy_uzemia', [:zonfp_id, :typ_uzemia_id], unique: true, name: 'index_itms.zonfp_prijate_typy_uzemia_on_z_and_tu'

    create_table 'itms.zonfp_prijate_uzemne_mechanizmy' do |t|
      t.references :zonfp, null: false, foreign_key: { to_table: 'itms.zonfp_prijate' }, index: true
      t.references :uzemny_mechanizmus, null: false, foreign_key: { to_table: 'itms.konkretne_ciele_hodnoty_ciselnikov' }, index: { name: 'index_itms.zonfp_prijate_uzemne_mechanizmy_on_um' }
      t.timestamps
    end
    add_index 'itms.zonfp_prijate_uzemne_mechanizmy', [:zonfp_id, :uzemny_mechanizmus_id], unique: true, name: 'index_itms.zonfp_prijate_uzemne_mechanizmy_on_z_and_um'
  end
end
