class CreateMetais < ActiveRecord::Migration[6.0]
  def up
    execute 'CREATE SCHEMA metais'

    create_table 'metais.projekty' do |t|
      t.string :uuid, null: false
      t.timestamps
    end

    create_table 'metais.isvs' do |t|
      t.belongs_to :projekt, foreign_key: { to_table: 'metais.projekty' }
      t.string :uuid, null: false
      t.timestamps
    end

    create_table 'metais.dokumenty_projekty' do |t|
      t.belongs_to :projekt, foreign_key: { to_table: 'metais.projekty' }
      t.string :uuid, null: false
      t.timestamps
    end

    create_table 'metais.dokumenty_isvs' do |t|
      t.belongs_to :isvs, foreign_key: { to_table: 'metais.isvs' }
      t.string :uuid, null: false
      t.timestamps
    end
  end

  def down
    execute 'DROP SCHEMA metais CASCADE'
  end
end
