class CreateItmsCodelists < ActiveRecord::Migration[5.0]
  def change
    # TODO remove
    create_table 'itms.kody' do |t|
      t.integer :kod_id
      t.string :kod_zdroj
      t.string :nazov

      t.timestamps
    end

    create_table 'itms.ciselniky' do |t|
      t.integer :ciselnik_kod, null: false, index: { unique: true}
      t.string :nazov
      t.string :popis
      t.timestamps
    end

    create_table 'itms.hodnoty_ciselnikov' do |t|
      t.references :ciselnik, index: true, foreign_key: { to_table: 'itms.ciselniky' }

      t.integer :itms_id, null: false, index: true
      t.string :itms_href
      t.string :kod
      t.string :kod_zdroj
      t.string :nazov
      t.datetime :platnost_do
      t.datetime :platnost_od
      t.string :popis
    end

    add_index 'itms.hodnoty_ciselnikov', [:ciselnik_id, :itms_id], unique: true
  end
end
