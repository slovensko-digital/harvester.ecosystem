class CreateItmsAccountingDocumentsV2 < ActiveRecord::Migration[5.0]
  def change
    drop_table 'itms.uctovne_doklady', force: :cascade
    drop_table 'itms.uctovne_doklady_dodavatel', force: :cascade
    drop_table 'itms.uctovne_doklady_polozky_dokladu', force: :cascade
    drop_table 'itms.uctovne_doklady_projekty', force: :cascade
    drop_table 'itms.uctovne_doklady_verejne_obstaravania', force: :cascade
    drop_table 'itms.uctovne_doklady_vlastnik_dokladu', force: :cascade
    
    create_table 'itms.uctovne_doklady' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      #TODO
      t.timestamps
    end
  end
end
