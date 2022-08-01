class AddMetaisToOpenDataRole < ActiveRecord::Migration[6.0]
  def change
    execute 'GRANT USAGE ON SCHEMA metais to open_data'
    execute 'GRANT SELECT ON ALL TABLES IN SCHEMA metais TO open_data;'
    execute 'ALTER DEFAULT PRIVILEGES IN SCHEMA metais GRANT SELECT ON TABLES TO open_data'
  end
end
  