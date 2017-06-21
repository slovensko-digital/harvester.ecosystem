class AllowOpenDataInItms < ActiveRecord::Migration[5.0]
  def change
    execute 'GRANT USAGE ON SCHEMA itms to open_data'
    execute 'GRANT SELECT ON ALL TABLES IN SCHEMA itms TO open_data;'
    execute 'ALTER DEFAULT PRIVILEGES IN SCHEMA itms GRANT SELECT ON TABLES TO open_data'
  end
end
