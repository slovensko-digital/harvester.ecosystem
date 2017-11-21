class UpdateItmsSpecificGoals < ActiveRecord::Migration[5.0]
  def change
    drop_table 'itms.konkretne_ciele_prioritna_os'
    drop_table 'itms.konkretne_ciele'

    create_table 'itms.konkretne_ciele' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.references :fond, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.references :kategoria_regionov, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.string :kod
      t.string :nazov
      t.references :prioritna_os, foreign_key: { to_table: 'itms.prioritne_osi' }
      t.boolean :technicka_asistencia

      t.timestamps
    end

    create_table 'itms.konkretne_ciele_typy_aktivit' do |t|
      t.references :konkretny_ciel, null: false, foreign_key: { to_table: 'itms.konkretne_ciele' }, index: true
      t.references :typ_aktivity, null: false, index: true # Foreign key in 20171008150512
      t.timestamps
    end
    add_index 'itms.konkretne_ciele_typy_aktivit',
              [:konkretny_ciel_id, :typ_aktivity_id],
              name: 'index_itms.konkretne_ciele_typy_aktivit_on_kc_and_ta',
              unique: true
  end
end
