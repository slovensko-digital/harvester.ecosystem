class CreateUpvsPublicAuthorityEdesks < ActiveRecord::Migration[5.0]
  def up
    execute 'CREATE SCHEMA upvs'

    create_table 'upvs.public_authority_edesks' do |t|
      t.integer :cin, null: false, limit: 8
      t.string :uri, null: false
      t.string :name, null: false
      t.string :street
      t.string :street_number
      t.string :postal_code
      t.string :city

      t.timestamps
    end

    add_index 'upvs.public_authority_edesks', :uri, unique: true
    add_index 'upvs.public_authority_edesks', :cin
  end

  def down
    execute 'DROP SCHEMA upvs CASCADE'
  end
end
