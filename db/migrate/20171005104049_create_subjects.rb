class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    drop_table 'itms.subjekty'
    
    create_table 'itms.subjekty' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.string :dic
      t.decimal :gps_lat
      t.decimal :gps_lon
      t.string :ico
      t.string :ine_identifikacne_cislo
      t.string :nazov
      t.string :obec
      t.string :psc
      t.string :stat
      t.string :typ_ineho_identifikacneho_cisla
      t.string :ulica
      t.string :ulica_cislo

      t.timestamps
    end
  end
end
