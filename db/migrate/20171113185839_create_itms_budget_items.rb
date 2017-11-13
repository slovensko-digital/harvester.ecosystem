class CreateItmsBudgetItems < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.polozky_rozpoctu' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      #TODO: finish
      t.timestamps
    end

    create_table 'itms.projekty_polozky_rozpoctu' do |t|
      t.references :projekt, null: false, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :polozka_rozpoctu,
                   null: false,
                   index: true,
                   foreign_key: { to_table: 'itms.polozky_rozpoctu' }
      t.timestamps
    end
  end
end
