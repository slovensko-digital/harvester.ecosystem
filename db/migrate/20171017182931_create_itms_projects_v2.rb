class CreateItmsProjectsV2 < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.projekty' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.string :akronym
      #TODO t.string :aktivity
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
      #TODO t.string :formy_financovania
      #TODO t.string :hospodarske_cinnosti
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
      #TODO t.string :sekundarny_tematicky_okruh
      t.string :stav
      t.decimal :suma_celkova_projektov_generujucich_prijem
      t.decimal :suma_zazmluvnena
      t.decimal :suma_zazmluvnena_povodna
      #TODO t.string :typy_uzemia
      t.string :url_adresa_zmluva
      #TODO t.string :uzemne_mechanizmy
      #TODO t.string :vyzva
      t.string :zameranie_projektu

      t.timestamps
    end

    create_table 'itms.projekty_aktivity' do |t|
      t.references :projekt, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :aktivita, index: true, foreign_key: { to_table: 'itms.aktivity' }
      t.timestamps
    end
  end
end
