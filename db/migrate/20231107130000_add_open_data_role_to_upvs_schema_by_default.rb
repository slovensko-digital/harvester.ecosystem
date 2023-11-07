class AddOpenDataRoleToUpvsSchemaByDefault < ActiveRecord::Migration[6.0]
  def change
    execute 'GRANT USAGE ON SCHEMA upvs to open_data'
    execute 'GRANT SELECT ON ALL TABLES IN SCHEMA upvs TO open_data'
    execute 'ALTER DEFAULT PRIVILEGES IN SCHEMA upvs GRANT SELECT ON TABLES TO open_data'
  end
end
