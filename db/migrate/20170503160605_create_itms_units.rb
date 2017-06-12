class CreateItmsUnits < ActiveRecord::Migration[5.0]
  def up
    create_table 'itms.subjekty' do |t|
      t.integer :itms_identifier, null: false, limit: 8, unique: true
      t.string :dic
      t.string :ico
      t.string :ine_identifikacne_cislo
      t.string :nazov
      t.datetime :updated_at
      t.datetime :created_at
    end
  end

  def down
    drop_table 'itms.subjekty'
  end
end
