class ItmsAddUctovneDokladyProjekty < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.uctovne_doklady_projekty' do |t|
      t.references :uctovny_doklad, null: false, foreign_key: { to_table: 'itms.uctovne_doklady' }, index: true
      t.references :projekt, null: false, foreign_key: { to_table: 'itms.projekty' }, index: true
      t.timestamps
    end
    add_index 'itms.uctovne_doklady_projekty', [:uctovny_doklad_id, :projekt_id], unique: true, name: 'index_itms.uctovne_doklady_projekty_on_ud_and_p'
  end
end
