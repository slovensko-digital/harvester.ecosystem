class ChangeUpvsPublicAuthorityEdesks < ActiveRecord::Migration[5.0]
  def change
    change_table 'upvs.public_authority_edesks' do |t|
      t.remove :street, :street_number, :postal_code, :city
    end
  end
end
