class CreateItmsAdditionalJoinTablesAndForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key 'itms.nezrovnalosti', 'itms.projekty', column: :projekt_id

    create_table 'itms.nezrovnalosti_suvisiace_verejne_obstaravania' do |t|
      t.references :nezrovnalost, null: false, foreign_key: { to_table: 'itms.nezrovnalosti' }, index: { name: 'index_itms.nezrovnalosti_suvisiace_verejne_obstaravania_on_n' }
      t.references :verejne_obstaravanie, null: false, foreign_key: { to_table: 'itms.verejne_obstaravania' }, index: { name: 'index_itms.nezrovnalosti_suvisiace_verejne_obstaravania_on_vo' }
      t.timestamps
    end
    add_index 'itms.nezrovnalosti_suvisiace_verejne_obstaravania',
              [:nezrovnalost_id, :verejne_obstaravanie_id],
              name: 'index_itms.nezrovnalosti_suvisiace_vo_on_n_and_vo',
              unique: true

    create_table 'itms.nezrovnalosti_suvisiace_zop' do |t|
      t.references :nezrovnalost, null: false, foreign_key: { to_table: 'itms.nezrovnalosti' }, index: true
      t.references :zop, null: false, foreign_key: { to_table: 'itms.zop' }, index: true
      t.timestamps
    end
    add_index 'itms.nezrovnalosti_suvisiace_zop',
              [:nezrovnalost_id, :zop_id],
              name: 'index_itms.nezrovnalosti_suvisiace_zop_on_nezrovnalost_and_zop',
              unique: true


    add_foreign_key 'itms.pohladavkove_doklady', 'itms.projekty', column: :projekt_id

    create_table 'itms.pohladavkove_doklady_suvisiace_verejne_obstaravania' do |t|
      t.references :pohladavkovy_doklad, null: false, foreign_key: { to_table: 'itms.pohladavkove_doklady' }, index: { name: 'index_itms.pohladavkove_doklady_suvisiace_vo_on_pd' }
      t.references :verejne_obstaravanie, null: false, foreign_key: { to_table: 'itms.verejne_obstaravania' }, index: { name: 'index_itms.pohladavkove_doklady_suvisiace_vo_on_vo' }
      t.timestamps
    end
    add_index 'itms.pohladavkove_doklady_suvisiace_verejne_obstaravania',
              [:pohladavkovy_doklad_id, :verejne_obstaravanie_id],
              name: 'index_itms.pohladavkove_doklady_suvisiace_vo_on_pd_and_vo',
              unique: true

    create_table 'itms.pohladavkove_doklady_suvisiace_zop' do |t|
      t.references :pohladavkovy_doklad, null: false, foreign_key: { to_table: 'itms.pohladavkove_doklady' }, index: { name: 'index_itms.pohladavkove_doklady_suvisiace_zop_on_pd' }
      t.references :zop, null: false, foreign_key: { to_table: 'itms.zop' }, index: true
      t.timestamps
    end
    add_index 'itms.pohladavkove_doklady_suvisiace_zop',
              [:pohladavkovy_doklad_id, :zop_id],
              name: 'index_itms.pohladavkove_doklady_suvisiace_zop_on_pd_and_zop',
              unique: true
  end
end
