class CreateMetais < ActiveRecord::Migration[6.0]
  def up
    execute 'CREATE SCHEMA metais'

    create_table 'metais.projekty' do |t|
      t.string :uuid, null: false
      t.string :nazov
      t.text :popis
      t.datetime :datum_zacatia
      t.datetime :termin_ukoncenia
      t.string :schvalovaci_proces
      t.string :kod_metais
      t.string :typ_investicie
      t.string :zdroj
      t.string :financna_skupina
      t.string :prijimatel
      t.string :faza_projektu
      t.decimal :suma_vydavkov
      t.decimal :rocne_naklady
      t.string :ref_id
      t.string :program
      t.string :status
  
      t.datetime :zmena_stavu
      t.decimal :schvalene_rocne_naklady
      t.decimal :schvaleny_rozpocet
      t.datetime :datum_nfp
      t.string :link_nfp
      t.datetime :vyhlasenie_vo
      t.string :vo
      t.datetime :zmluva_o_dielo
      t.string :zmluva_o_dielo_crz
  
      t.text :raw_data
      t.timestamps
    end
  
    create_table 'metais.dokumenty_projekty' do |t|
      t.string :uuid, null: false
      t.string :nazov
      t.text :poznamka
      t.string :typ
      t.string :kod_metais
      t.string :ref_id
      t.string :filename
      t.string :mimetype
      t.string :size
      t.string :stav_evidencie
      t.datetime :metais_created_at
      t.datetime :metais_updated_at
      t.belongs_to :projekt, class_name: 'Metais::Project'
  
      t.text :raw_data
      t.text :raw_meta
      t.timestamps
    end
  
    create_table 'metais.dokumenty_isvs' do |t|
      t.string :uuid, null: false
      t.string :nazov
      t.text :poznamka
      t.string :typ
      t.string :kod_metais
      t.string :ref_id
      t.string :filename
      t.string :mimetype
      t.string :size
      t.string :stav_evidencie
      t.datetime :metais_created_at
      t.datetime :metais_updated_at
      t.belongs_to :isvs, class_name: 'Metais::Isvs'
  
      t.text :raw_data
      t.text :raw_meta
      t.timestamps
    end
  
    create_table 'metais.isvs' do |t|
      t.string :uuid, null: false
      t.belongs_to :projekt, foreign_key: { to_table: 'metais.projekty' }
  
      t.text :raw_data
      t.timestamps
    end
  end

  def down
    execute 'DROP SCHEMA metais CASCADE'
  end
end
