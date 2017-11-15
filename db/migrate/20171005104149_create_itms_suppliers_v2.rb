class CreateItmsSuppliersV2 < ActiveRecord::Migration[5.0]
  def change
    drop_table 'itms.dodavatelia'
    
    create_table 'itms.dodavatelia' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.string :itms_created_at
      t.string :itms_updated_at

      t.string :dic
      t.string :ico
      t.string :ine_identifikacne_cislo
      t.string :nazov
      t.references :obec, foreign_key: { to_table: 'itms.nuts_kody' }
      t.string :psc
      t.references :stat, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.references :typ_ineho_identifikacneho_cisla, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.string :ulica
      t.string :ulica_cislo

      t.timestamps
    end
  end
end
