class CreateItmsOrganisationalUnits < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.organizacne_zlozky' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :adresa
      t.string :nazov
      t.timestamps
    end

    create_table 'itms.projekty_organizacne_zlozky' do |t|
      t.references :projekt, null: false, index: true, foreign_key: { to_table: 'itms.projekty' }
      t.references :organizacna_zlozka,
                   null: false,
                   index: { name: 'index_itms.projekty_organizacne_zlozky_on_zlozka' },
                   foreign_key: { to_table: 'itms.organizacne_zlozky' }
      t.timestamps
    end
  end
end
