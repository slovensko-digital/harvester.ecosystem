class CreateItmsPersons < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.osoby' do |t|
      t.integer :itms_id, null: false, index: { unique: true}

      t.string :email
      t.string :meno
      t.string :meno_uplne
      t.string :priezvisko
      t.string :telefon

      t.timestamps
    end
  end
end
