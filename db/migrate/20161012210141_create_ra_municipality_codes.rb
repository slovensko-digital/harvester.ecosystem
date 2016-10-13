class CreateRaMunicipalityCodes < ActiveRecord::Migration[5.0]
  def change
    create_table 'ra.municipality_codes' do |t|
      t.string :code
      t.string :name, null: false

      t.timestamps
    end

    add_index 'ra.municipality_codes', [:code, :name], unique: true
  end
end
