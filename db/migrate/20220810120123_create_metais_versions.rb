class CreateMetaisVersions < ActiveRecord::Migration[6.0]
  def change
    create_table 'metais.verzie_projekty' do |t|
      t.belongs_to :projekt, null: false, foreign_key: { to_table: 'metais.projekty' }

      t.string :nazov, null: false
      t.string :kod_metais, null: false
      t.string :typ_investicie, null: false
      t.string :prijimatel
      t.string :faza_projektu
      t.string :program
      t.text :popis
      t.datetime :datum_zacatia
      t.datetime :termin_ukoncenia
      t.string :schvalovaci_proces
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
      t.belongs_to :isvs, null: false, foreign_key: { to_table: 'metais.isvs' }

      t.string :nazov, null: false
      t.string :kod_metais, null: false
      t.string :ref_id
      t.text :popis
      t.text :popis_as_is
      t.text :poznamka
      t.string :zdroj
      t.string :stav
      t.string :typ

      t.text :raw_data, null: false
      t.timestamps
    end

    create_table 'metais.verzie_dokumenty_projekty' do |t|
      t.belongs_to :dokument, null: false, foreign_key: { to_table: 'metais.dokumenty_projekty' }

      t.string :nazov, null: false
      t.string :kod_metais, null: false
      t.string :ref_id, null: false
      t.string :mimetype
      t.string :size
      t.string :stav_evidencie
      t.text :poznamka
      t.string :typ
      t.string :filename
      t.datetime :metais_created_at
      t.datetime :metais_updated_at
  
      t.text :raw_data, null: false
      t.text :raw_meta, null: false
      t.timestamps
    end

    create_table 'metais.verzie_dokumenty_isvs' do |t|
      t.belongs_to :dokument, null: false, foreign_key: { to_table: 'metais.dokumenty_isvs' }

      t.string :nazov, null: false
      t.string :kod_metais, null: false
      t.string :ref_id, null: false
      t.string :mimetype
      t.string :size
      t.string :stav_evidencie
      t.text :poznamka
      t.string :typ
      t.string :filename
      t.datetime :metais_created_at
      t.datetime :metais_updated_at
  
      t.text :raw_data, null: false
      t.text :raw_meta, null: false
      t.timestamps
    end
  end
end
