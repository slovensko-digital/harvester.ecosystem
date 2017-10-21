class CreateItmsSpecificGoalCodes < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.kody_konkretnych_cielov' do |t|
      t.integer :kod_id
      t.string :kod_zdroj
      t.references :konkretny_ciel, index: true, foreign_key: { to_table: 'itms.konkretne_ciele' }
      t.string :nazov

      t.timestamps
    end

    add_index 'itms.kody_konkretnych_cielov',
              [:kod_id, :kod_zdroj, :konkretny_ciel_id],
              name: 'index_itms.kody_konkretnych_cielov_on_kod_and_zdroj_and_ciel',
              unique: true
  end
end
