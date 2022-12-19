class CreateEidStats < ActiveRecord::Migration[6.0]
  def up
    execute 'CREATE SCHEMA eid22'


    # jp - char(3) REFERENCES JednotnePracoviska - jednoté pracovisko
    # claimNo - smallint - cislo ziadosti, vzdy medzi 1-999
    # dateClaimed (date) - rok-mesiac-den podania ziadosti o eID
    # dateReady (date) - rok-mesiac-den, kedy je pre túto žiadosť eID vytlačený a pripravený na prevzatie, NULL kym nie je
    # dateTaken (date) - rok-mesiac-den, kedy si držiteľ prevzal eID, NULL kym nie je
    # primaryKey: jp, claimNo, dateClaimed

    create_table 'eid22.eIdClaims', {:id => false} do |t|
      t.string :jp, foreign_key: { to_table: 'eid22.JednotnePracoviska' }
      t.integer :claimNo, null: false
      t.date :dateClaimed
      t.date :dateReady
      t.date :dateTaken
    end
    execute "ALTER TABLE \"eid22\".\"eIdClaims\" ADD PRIMARY KEY (\"jp\", \"claimNo\", \"dateClaimed\");"


    # id - char(3) - identifikátor jednotného pracoviska, napr. "BA4"
    # name - varchar(40) - názov jednotného pracoviska, napr. "Bratislava 4"
    # primaryKey: id

    create_table 'eid22.JednotnePracoviska', id: :string, primary_key: :id do |t|
      t.string :name, null: false
    end


    # ts - timestamp - čas vytvorenia záznamu
    # text - varchar(60) - text záznamu

    create_table 'eid22.workLog' do |t|
      t.datetime :ts, null: false
      t.text :text, null: false
    end

    execute 'GRANT USAGE ON SCHEMA eid22 to open_data'
    execute 'GRANT SELECT ON ALL TABLES IN SCHEMA eid22 TO open_data;'
    execute 'ALTER DEFAULT PRIVILEGES IN SCHEMA eid22 GRANT SELECT ON TABLES TO open_data'
  end

  def down
    execute 'DROP SCHEMA eid22 CASCADE'
  end
end
