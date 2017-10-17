class CreateItmsProjectActivities < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.aktivity' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href

      t.datetime :datum_konca_planovany
      t.datetime :datum_konca_skutocny
      t.datetime :datum_zaciatku_planovany
      t.datetime :datum_zaciatku_skutocny
      t.string :kod
      t.string :nazov
      t.references :subjekt, index: true, foreign_key: { to_table: 'itms.subjekty' }
      t.references :typ_aktivity, index: true, foreign_key: { to_table: 'itms.typy_aktivit' }

      t.timestamps
    end
  end
end
