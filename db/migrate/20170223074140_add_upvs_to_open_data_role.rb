class AddUpvsToOpenDataRole < ActiveRecord::Migration[5.0]
  def up
    execute 'GRANT USAGE ON SCHEMA upvs TO open_data'
    execute 'GRANT SELECT ON ALL TABLES IN SCHEMA upvs TO open_data'
  end
end
