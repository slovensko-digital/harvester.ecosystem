class CreateItmsOrganisationalUnits < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.organizacne_zlozky' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      t.string :adresa
      t.string :nazov
      t.timestamps
    end
  end
end
