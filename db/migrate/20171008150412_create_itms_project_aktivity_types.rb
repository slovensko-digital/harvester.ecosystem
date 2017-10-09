class CreateItmsProjectAktivityTypes < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.typy_aktivit' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href
      t.datetime :itms_created_at
      t.datetime :itms_updated_at

      t.string :kod
      t.string :nazov

      t.timestamps
    end
  end
end
