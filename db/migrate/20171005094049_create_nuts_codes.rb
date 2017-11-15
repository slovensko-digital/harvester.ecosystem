class CreateNutsCodes < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.nuts_kody' do |t|
      t.decimal :gps_lat
      t.decimal :gps_lon
      t.references :hodnota_nuts, index: true, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.timestamps
    end
  end
end
