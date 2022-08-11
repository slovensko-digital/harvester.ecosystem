class AddLatestVersionToMetais < ActiveRecord::Migration[6.0]
  def change
    add_reference 'metais.projekty', :latest_version, foreign_key: { to_table: 'metais.verzie_projekty' }, index: true
    add_reference 'metais.isvs', :latest_version, foreign_key: { to_table: 'metais.verzie_isvs' }, index: true
    add_reference 'metais.dokumenty_projekty', :latest_version, foreign_key: { to_table: 'metais.verzie_dokumenty_projekty' }, index: true
    add_reference 'metais.dokumenty_isvs', :latest_version, foreign_key: { to_table: 'metais.verzie_dokumenty_isvs' }, index: true
  end
end
