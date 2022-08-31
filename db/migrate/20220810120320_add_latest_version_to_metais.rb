class AddLatestVersionToMetais < ActiveRecord::Migration[6.0]
  def change
    add_reference 'metais.projects', :latest_version, foreign_key: { to_table: 'metais.project_versions' }, index: true
    add_reference 'metais.isvs', :latest_version, foreign_key: { to_table: 'metais.isvs_versions' }, index: true
    add_reference 'metais.project_documents', :latest_version, foreign_key: { to_table: 'metais.project_document_versions' }, index: true
    add_reference 'metais.isvs_documents', :latest_version, foreign_key: { to_table: 'metais.isvs_document_versions' }, index: true
  end
end
