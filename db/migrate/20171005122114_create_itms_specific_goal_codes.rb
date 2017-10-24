class CreateItmsSpecificGoalCodes < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.kody_konkretne_ciele' do |t|
      t.references :kod, index: true, foreign_key: { to_table: 'itms.kody' }
      t.references :konkretny_ciel, index: true, foreign_key: { to_table: 'itms.konkretne_ciele' }

      t.timestamps
    end

    add_index 'itms.kody_konkretne_ciele', [:kod_id, :konkretny_ciel_id], unique: true
  end
end
