class UpdateItmsSpecificGoals < ActiveRecord::Migration[5.0]
  def change
    drop_table 'itms.konkretne_ciele_prioritna_os'
    drop_table 'itms.konkretne_ciele'

    create_table 'itms.konkretne_ciele' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.references :fond, index: true, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.string :kategoria_regionov
      t.string :kod
      t.string :nazov
      # TODO prioritna_os,
      t.boolean :technicka_asistencia
      # TODO typy_aktivit,

      t.timestamps
    end
  end
end
