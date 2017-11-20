class CreateItmsAdditionalJoinTablesAndForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key 'itms.nezrovnalosti', 'itms.projekty', column: :projekt_id

    create_table 'itms.nezrovnalosti_suvisiace_verejne_obstaravania' do |t|
      t.references :nezrovnalost, foreign_key: { to_table: 'itms.nezrovnalosti' }, index: { name: 'index_itms.nezrovnalosti_suvisiace_verejne_obstaravania_on_n' }
      t.references :verejne_obstaravanie, foreign_key: { to_table: 'itms.verejne_obstaravania' }, index: { name: 'index_itms.nezrovnalosti_suvisiace_verejne_obstaravania_on_vo' }
      t.timestamps
    end
    add_index 'itms.nezrovnalosti_suvisiace_verejne_obstaravania',
              [:nezrovnalost_id, :verejne_obstaravanie_id],
              name: 'index_itms.nezrovnalosti_suvisiace_vo_on_n_and_vo',
              unique: true

    create_table 'itms.nezrovnalosti_suvisiace_zop' do |t|
      t.references :nezrovnalost, foreign_key: { to_table: 'itms.nezrovnalosti' }, index: true
      t.references :zop, foreign_key: { to_table: 'itms.zop' }, index: true
      t.timestamps
    end
    add_index 'itms.nezrovnalosti_suvisiace_zop',
              [:nezrovnalost_id, :zop_id],
              name: 'index_itms.nezrovnalosti_suvisiace_zop_on_nezrovnalost_and_zop',
              unique: true
  end
end
