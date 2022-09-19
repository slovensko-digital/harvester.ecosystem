class CreateMetaisProjectsChangelist < ActiveRecord::Migration[6.0]
  def change
    create_table 'metais.projects_changelists' do |t|
      t.belongs_to :project_version, null: false, foreign_key: { to_table: 'metais.project_versions' }

      t.string :atribut
      t.string :predchadzajuca_hodnota
      t.string :nova_hodnota

      t.timestamps
    end
  end
end
