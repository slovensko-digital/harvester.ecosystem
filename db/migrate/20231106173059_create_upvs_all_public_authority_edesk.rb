class CreateUpvsAllPublicAuthorityEdesk < ActiveRecord::Migration[6.0]
  def change
    create_table 'upvs.all_public_authority_edesks' do |t|
      t.integer :cin, null: false, limit: 8
      t.string :uri, null: false
      t.string :name, null: false

      t.timestamps
    end

    add_index 'upvs.all_public_authority_edesks', :uri, unique: true
    add_index 'upvs.all_public_authority_edesks', :cin
  end
end
