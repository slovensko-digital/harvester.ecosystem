class CreateItmsSpecificGoals < ActiveRecord::Migration[5.0]
  def up
    create_table 'itms.konkretne_ciele' do |t|
      t.integer :itms_identifier, null: false, limit: 8, unique: true
      t.string :fond
      t.string :kategoria_regionov
      t.string :kod
      t.string :nazov
      t.boolean :technicka_asistencia
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table 'itms.konkretne_ciele_prioritna_os' do |t|
      t.integer :itms_identifier, null: false, limit: 8
      t.integer :konkretne_ciele_id, null: false, limit: 8
    end
    add_foreign_key 'itms.konkretne_ciele_prioritna_os', 'itms.konkretne_ciele', column: 'konkretne_ciele_id'
  end

  def down
    drop_table 'itms.konkretne_ciele_prioritna_os'
    drop_table 'itms.konkretne_ciele'
  end
end
