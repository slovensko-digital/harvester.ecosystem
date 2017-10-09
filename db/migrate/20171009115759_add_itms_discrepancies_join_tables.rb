class AddItmsDiscrepanciesJoinTables < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.nezrovnalosti_suvisiace_nezrovnalosti' do |t|
      t.references :nezrovnalost, index: { name: 'index_itms.nezrovnalosti_suvisiace_nezrovnalosti_nezrovnalost' }, foreign_key: { to_table: 'itms.nezrovnalosti' }
      t.references :suvisiaca_nezrovnalost, index: { name: 'index_itms.nezrovnalosti_suvisiace_nezrovnalosti_suvisiaca' }, foreign_key: { to_table: 'itms.nezrovnalosti' }
      t.timestamps
    end

    create_table 'itms.nezrovnalosti_suvisiace_pohladavkove_doklady' do |t|
      t.references :nezrovnalost, index: { name: 'index_itms.nezrovnalosti_pohladavkove_doklady_nezrovnalost' }, foreign_key: { to_table: 'itms.nezrovnalosti' }
      t.references :pohladavkovy_doklad, index: { name: 'index_itms.nezrovnalosti_pohladavkove_doklady_doklad' }, foreign_key: { to_table: 'itms.pohladavkove_doklady' }
      t.timestamps
    end
  end
end
