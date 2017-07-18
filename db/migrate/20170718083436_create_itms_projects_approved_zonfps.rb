class CreateItmsProjectsApprovedZonfps < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.projekty_vrealizacii_schvalene_zonfp' do |t|
      t.integer :itms_identifier, limit: 8
      t.integer :projekty_vrealizacii_id
    end
    add_foreign_key 'itms.projekty_vrealizacii_schvalene_zonfp', 'itms.projekty_vrealizacii', column: 'projekty_vrealizacii_id'

    create_table 'itms.projekty_ukoncene_schvalene_zonfp' do |t|
      t.integer :itms_identifier, limit: 8
      t.integer :projekty_ukoncene_id
    end
    add_foreign_key 'itms.projekty_ukoncene_schvalene_zonfp', 'itms.projekty_ukoncene', column: 'projekty_ukoncene_id'
  end
end
