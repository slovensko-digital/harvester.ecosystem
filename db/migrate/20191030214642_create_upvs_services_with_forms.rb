class CreateUpvsServicesWithForms < ActiveRecord::Migration[5.0]
  def change
    create_table 'upvs.services_with_forms' do |t|
      t.integer :instance_id, null: false
      t.string :external_code
      t.string :meta_is_code
      t.string :name
      t.string :type
      t.string :institution_uri, null: false
      t.string :institution_name
      t.datetime :valid_from
      t.datetime :valid_to
      t.string :url
      t.string :info_url
      t.string :schema_url
      t.datetime :changed_at

      t.timestamps null: false
    end

    add_index 'upvs.services_with_forms', :instance_id, unique: true
    add_index 'upvs.services_with_forms', :institution_uri
  end
end
