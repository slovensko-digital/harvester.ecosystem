class CreateItmsCodes < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.kody' do |t|
      t.integer :kod_id
      t.string :kod_zdroj
      t.string :nazov

      t.timestamps
    end

    add_index 'itms.kody', [:kod_id, :kod_zdroj], unique: true
  end
end
