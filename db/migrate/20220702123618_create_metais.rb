class CreateMetais < ActiveRecord::Migration[6.0]
  def up
    execute 'CREATE SCHEMA metais'
  end

  def down
    execute 'DROP SCHEMA metais'
  end

  def change
    create_table 'metais.projekty' do |t|
      t.string :uuid, null: false
      t.string :nazov
      t.text :popis
      t.datetime :datum_zaciatku
      t.datetime :datum_ukoncenia
      t.string :schvalovaci_proces
      t.string :kod_metais
      t.string :typ_investicie
      t.string :zdroj
      t.string :financna_skupina
      t.string :prijimatel
      t.string :faza
      t.decimal :naklady_spolu
      t.decimal :prevadzka_rocne
      t.string :ref_id
      t.string :program
      t.string :status

      t.datetime :datum_zmeny_stavu_projektu
      t.decimal :schvalena_prevadzka_rocne
      t.decimal :schvalene_naklady_spolu
      t.datetime :datum_ucinnosti_zmluvy_nfp
      t.string :link_nfp_v_crz
      t.datetime :datum_zverejnenia_vo
      t.string :link_vvo
      t.datetime :datum_ucinnosti_zmluvy_dielo
      t.string :link_dielo_v_crz

      t.text :raw_data
      t.boolean :parsed, default: false
      t.timestamps
    end

    create_table 'metais.dokumenty' do |t|
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
      t.references :attachable, polymorphic: true
      
      t.text :raw_data
      t.text :raw_meta
      t.boolean :parsed, default: false
      t.timestamps
    end

    create_table 'metais.isvs' do |t|
      t.string :uuid, null: false
      t.belongs_to :projekt, foreign_key: { to_table: 'metais.projekty' }

      t.text :raw_data
      t.boolean :parsed, default: false
      t.timestamps
    end
  end
end
