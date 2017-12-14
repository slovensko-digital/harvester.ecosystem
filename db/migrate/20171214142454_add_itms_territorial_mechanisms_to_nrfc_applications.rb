class AddItmsTerritorialMechanismsToNrfcApplications < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.zonfp_uzemne_mechanizmy' do |t|
      t.references :zonfp, null: false, foreign_key: { to_table: 'itms.zonfp' }, index: true
      t.references :uzemny_mechanizmus, null: false, foreign_key: { to_table: 'itms.konkretne_ciele_hodnoty_ciselnikov' }, index: true
      t.timestamps
    end
    add_index 'itms.zonfp_uzemne_mechanizmy', [:zonfp_id, :uzemny_mechanizmus_id], unique: true, name: 'index_itms.zonfp_uzemne_mechanizmy_on_z_and_um'
  end
end
