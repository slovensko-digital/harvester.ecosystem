class CreateDigitalServicesAndForms < ActiveRecord::Migration[5.0]
  def change
    create_table 'upvs.digital_services_and_forms' do |t|
      t.integer :id_service_instance, null: false
      t.string :external_code
      t.string :meta_code
      t.string :name
      t.string :service_type
      t.string :uri, null: false
      t.string :institution_name
      t.timestamp  :valid_from
      t.timestamp :valid_to
      t.string :url, null: false
      t.string :info_url
      t.string :form_url, null: false
      t.timestamp :last_updated

      t.timestamps
    end

    add_index 'upvs.digital_services_and_forms', :uri, unique: true
  end
end
