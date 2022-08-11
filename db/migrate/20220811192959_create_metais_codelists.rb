class CreateMetaisCodelists < ActiveRecord::Migration[6.0]
  def change
    create_table 'metais.codelist_program' do |t|
      t.string :kod_metais, null: false, unique: true
      t.string :nazov, null: false
      t.string :nazov_en
      t.string :ref_id
      t.string :zdroj

      t.text :raw_data
      t.timestamps
    end

    create_table 'metais.codelist_project_state' do |t|
      t.string :code, null: false, unique: true
      t.string :nazov, null: false
      t.integer :order_list, null: false
      t.string :popis

      t.timestamps
    end

    create_table 'metais.codelist_investment_type' do |t|
      t.string :code, null: false, unique: true
      t.string :nazov, null: false
      t.integer :order_list, null: false
      t.string :popis

      t.timestamps
    end

    create_table 'metais.codelist_project_phase' do |t|
      t.string :code, null: false, unique: true
      t.string :nazov, null: false
      t.integer :order_list, null: false
      t.string :popis

      t.timestamps
    end

    create_table 'metais.codelist_source' do |t|
      t.string :code, null: false, unique: true
      t.string :nazov, null: false
      t.integer :order_list, null: false
      t.string :popis

      t.timestamps
    end
  end
end
