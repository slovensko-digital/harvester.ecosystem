class CreateMetais < ActiveRecord::Migration[6.0]
  def up
    execute 'CREATE SCHEMA metais'

    create_table 'metais.projects' do |t|
      t.string :uuid, null: false, unique: true, index: true
      t.timestamps
    end

    create_table 'metais.isvs' do |t|
      t.belongs_to :project, foreign_key: { to_table: 'metais.projects' }
      t.string :uuid, null: false, unique: true, index: true
      t.timestamps
    end

    create_table 'metais.project_documents' do |t|
      t.belongs_to :project, foreign_key: { to_table: 'metais.projects' }
      t.string :uuid, null: false, unique: true, index: true
      t.timestamps
    end

    create_table 'metais.isvs_documents' do |t|
      t.belongs_to :isvs, foreign_key: { to_table: 'metais.isvs' }
      t.string :uuid, null: false, unique: true, index: true
      t.timestamps
    end
  end

  def down
    execute 'DROP SCHEMA metais CASCADE'
  end
end
