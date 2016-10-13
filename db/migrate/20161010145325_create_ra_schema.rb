class CreateRaSchema < ActiveRecord::Migration[5.0]
  def up
    execute 'CREATE SCHEMA ra'
  end

  def down
    execute 'DROP SCHEMA ra'
  end
end
