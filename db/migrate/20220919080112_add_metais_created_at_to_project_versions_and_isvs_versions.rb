class AddMetaisCreatedAtToProjectVersionsAndIsvsVersions < ActiveRecord::Migration[6.0]
  def change
    add_column 'metais.project_versions', :metais_created_at, :datetime
    add_column 'metais.isvs_versions', :metais_created_at, :datetime
  end
end
