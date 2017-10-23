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
      #TODO t.string :intenzity
      t.string :kod
      #TODO t.string :meratelne_ukazovatele
      #TODO t.string :miesta_realizacie
      #TODO t.string :monitorovacie_terminy
      t.string :nazov
      #TODO t.string :oblasti_intervencie
      #TODO t.string :organizacne_zlozky
      t.boolean :otvorena_zmena
      t.boolean :otvoreny_dodatok
      #TODO t.string :partneri
      #TODO t.string :polozky_rozpoctu
      t.string :popis_projektu
      t.references :prijimatel, index: true, foreign_key: { to_table: 'itms.subjekty' }
      #TODO t.string :schvalena_zonfp
      t.string :stav
      t.decimal :suma_celkova_projektov_generujucich_prijem
      t.decimal :suma_zazmluvnena
      t.decimal :suma_zazmluvnena_povodna
      t.string :url_adresa_zmluva
      #TODO t.string :vyzva
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
      t.references :forma_financovania, index: true, foreign_key: { to_table: 'itms.kody_konkretnych_cielov' }
      t.timestamps
    end

    create_table 'itms.projekty_hospodarske_cinnosti' do |t|
      t.references :projekt, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :hospodarska_cinnost, index: { name: 'index_itms.projekty_hospodarske_cinnosti_hosp_cinnost' }, foreign_key: { to_table: 'itms.kody_konkretnych_cielov' }
      t.timestamps
    end

    create_table 'itms.projekty_oblasti_intervencie' do |t|
      t.references :projekt, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :oblast_intervencie, index: { name: 'index_itms.projekty_oblasti_intervencie_oblast' }, foreign_key: { to_table: 'itms.kody_konkretnych_cielov' }
      t.timestamps
    end

    create_table 'itms.projekty_sekundarne_tematicke_okruhy' do |t|
      t.references :projekt, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :sekundarny_tematicky_okruh, index: { name: 'index_itms.projekty_sekundarne_tematicke_okruhy_okruh' }, foreign_key: { to_table: 'itms.kody_konkretnych_cielov' }
      t.timestamps
    end

    create_table 'itms.projekty_typy_uzemia' do |t|
      t.references :projekt, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :typ_uzemia, index: true, foreign_key: { to_table: 'itms.kody_konkretnych_cielov' }
      t.timestamps
    end

    create_table 'itms.projekty_uzemne_mechanizmy' do |t|
      t.references :projekt, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :uzemny_mechanizmus, index: true, foreign_key: { to_table: 'itms.kody_konkretnych_cielov' }
      t.timestamps
    end
  end
end