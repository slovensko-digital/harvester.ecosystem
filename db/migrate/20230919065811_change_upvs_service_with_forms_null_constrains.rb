class ChangeUpvsServiceWithFormsNullConstrains < ActiveRecord::Migration[6.0]
  def change
    change_column_null('upvs.services_with_forms', :institution_uri, true, 'Missing')
  end
end
