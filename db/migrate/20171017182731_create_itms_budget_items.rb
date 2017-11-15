class CreateItmsBudgetItems < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.polozky_rozpoctu' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :itms_href

      t.references :aktivita, foreign_key: { to_table: 'itms.aktivity' }
      t.references :intenzita, foreign_key: { to_table: 'itms.intenzity' }
      t.references :skupina_vydavkov, foreign_key: { to_table: 'itms.hodnoty_ciselnikov' }
      t.references :subjekt, foreign_key: { to_table: 'itms.subjekty' }
      t.decimal :viazana_suma
      t.decimal :volne_prostriedky
      t.decimal :vratena_suma
      t.decimal :zazmluvnena_suma

      t.timestamps
    end
  end
end
