class CreateItmsIntensities < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.zdroje_intenzit' do |t|
      t.decimal :cerpanie_eu
      t.decimal :cerpanie_ro
      t.integer :zdroj_id
      t.string :kod
      t.string :nazov
      t.decimal :percento
      t.decimal :suma_zazmluvnena

      t.timestamps
    end

    create_table 'itms.intenzity' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href

      t.string :nazov
      t.references :subjekt, index: true, foreign_key: { to_table: 'itms.subjekty' }
      t.references :zdroj_eu, index: true, foreign_key: { to_table: 'itms.zdroje_intenzit' }
      t.references :zdroj_pr, index: true, foreign_key: { to_table: 'itms.zdroje_intenzit' }
      t.references :zdroj_sr, index: true, foreign_key: { to_table: 'itms.zdroje_intenzit' }
      t.references :zdroj_vz, index: true, foreign_key: { to_table: 'itms.zdroje_intenzit' }
      t.references :zdroj_yei, index: true, foreign_key: { to_table: 'itms.zdroje_intenzit' }

      t.timestamps
    end
  end
end
