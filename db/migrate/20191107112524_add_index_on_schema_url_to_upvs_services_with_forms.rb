class AddIndexOnSchemaUrlToUpvsServicesWithForms < ActiveRecord::Migration[5.0]
  def change
    add_index 'upvs.services_with_forms', :schema_url
  end
end
