class CreateMetais < ActiveRecord::Migration[6.0]
  def up
    execute 'CREATE SCHEMA metais'

    create_table 'metais.projekty' do |t|
      t.string :uuid, null: false
      t.references :latest_version, null: false, foreign_key: { to_table: 'metais.verzie_projekty' }
      t.timestamps
    end

    create_table 'metais.isvs' do |t|
      t.belongs_to :projekt, foreign_key: { to_table: 'metais.projekty' }
      t.string :uuid, null: false
      t.references :latest_version, null: false, foreign_key: { to_table: 'metais.verzie_isvs' }
      t.timestamps
    end

    create_table 'metais.dokumenty_projekty' do |t|
      t.belongs_to :projekt, class_name: 'Metais::Project'
      t.string :uuid, null: false
      t.references :latest_version, null: false, foreign_key: { to_table: 'metais.verzie_dokumenty_projekty' }
      t.timestamps
    end

    create_table 'metais.dokumenty_isvs' do |t|
      t.belongs_to :isvs, class_name: 'Metais::Isvs'
      t.string :uuid, null: false
      t.references :latest_version, null: false, foreign_key: { to_table: 'metais.verzie_dokumenty_isvs' }
      t.timestamps
    end

    create_table 'metais.verzie_projekty' do |t|
      t.belongs_to :projekt, null: false, foreign_key: { to_table: 'metais.projekty' }

      t.string :nazov, null: false
      t.string :schvalovaci_proces, null: false
      t.string :kod_metais, null: false
      t.string :typ_investicie, null: false
      t.string :prijimatel, null: false
      t.string :faza_projektu, null: false
      t.string :program, null: false
      t.text :popis
      t.datetime :datum_zacatia
      t.datetime :termin_ukoncenia
      t.string :zdroj
      t.string :financna_skupina
      t.decimal :suma_vydavkov
      t.decimal :rocne_naklady
      t.string :ref_id
      t.string :stav
  
      t.datetime :zmena_stavu
      t.decimal :schvalene_rocne_naklady
      t.decimal :schvaleny_rozpocet
      t.datetime :datum_nfp
      t.string :link_nfp
      t.datetime :vyhlasenie_vo
      t.string :vo
      t.datetime :zmluva_o_dielo
      t.string :zmluva_o_dielo_crz
  
      t.text :raw_data, null: false
      t.timestamps
    end


    create_table 'metais.verzie_isvs' do |t|
      t.belongs_to :projekt, null: false, foreign_key: { to_table: 'metais.isvs' }

      t.text :raw_data, null: false
      t.timestamps
    end

    create_table 'metais.verzie_dokumenty_projekty' do |t|
      t.belongs_to :projekt, null: false, foreign_key: { to_table: 'metais.dokumenty_projekty' }

      t.string :nazov, null: false
      t.string :typ, null: false
      t.string :kod_metais, null: false
      t.string :ref_id, null: false
      t.string :filename, null: false
      t.string :mimetype, null: false
      t.string :size, null: false
      t.string :stav_evidencie, null: false
      t.text :poznamka
      t.datetime :metais_created_at
      t.datetime :metais_updated_at
  
      t.text :raw_data, null: false
      t.text :raw_meta, null: false
      t.timestamps
    end

    create_table 'metais.verzie_dokumenty_isvs' do |t|
      t.belongs_to :projekt, null: false, foreign_key: { to_table: 'metais.dokumenty_isvs' }

      t.string :nazov, null: false
      t.string :typ, null: false
      t.string :kod_metais, null: false
      t.string :ref_id, null: false
      t.string :filename, null: false
      t.string :mimetype, null: false
      t.string :size, null: false
      t.string :stav_evidencie, null: false
      t.text :poznamka
      t.datetime :metais_created_at
      t.datetime :metais_updated_at
  
      t.text :raw_data, null: false
      t.text :raw_meta, null: false
      t.timestamps
    end
  end

  def down
    execute 'DROP SCHEMA metais CASCADE'
  end
end
