class TemporaryRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.source
    raise NotImplementedError
  end

  def self.create_table!(pk: 'id')
    connection.execute("CREATE TEMPORARY TABLE #{table_name} ON COMMIT DROP AS TABLE #{source.table_name} WITH NO DATA")
    connection.execute("CREATE TEMPORARY SEQUENCE #{table_name}_#{pk}_seq OWNED BY #{table_name}.#{pk}")
    connection.execute("SELECT setval('#{table_name}_#{pk}_seq', (SELECT max(#{pk}) FROM #{source.table_name}))")
    connection.execute("ALTER TABLE #{table_name} ALTER COLUMN #{pk} SET DEFAULT nextval('#{table_name}_#{pk}_seq')")
  end

  def self.truncate_source_table!
    connection.execute("TRUNCATE TABLE #{source.table_name}")
  end

  def self.insert_to_source_table!
    connection.execute("INSERT INTO #{source.table_name} SELECT * FROM #{table_name}")
  end

  def self.table_name
    super&.gsub('.', '_')
  end
end
