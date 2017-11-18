class CreateItmsSpecificGoalsCodelistValues < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.konkretne_ciele_hodnoty_ciselnikov' do |t|
      t.references :konkretny_ciel,
                   index: { name: 'index_itms.konkretne_ciele_hodnoty_ciselnikov_on_kc' },
                   null: false,
                   foreign_key: { to_table: 'itms.konkretne_ciele' }
      t.references :hodnota_ciselnika,
                   index: { name: 'index_itms.konkretne_ciele_hodnoty_ciselnikov_on_hc' },
                   null: false,
                   foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.timestamps
    end
    add_index 'itms.konkretne_ciele_hodnoty_ciselnikov',
              [:konkretny_ciel_id, :hodnota_ciselnika_id],
              name: 'index_itms.konkretne_ciele_hodnoty_ciselnikov_on_kc_hc',
              unique: true
  end
end
