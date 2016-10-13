class CreateRaCountyCodes < ActiveRecord::Migration[5.0]
  def change
    create_table 'ra.county_codes' do |t|
      t.string :code
      t.string :name, null: false

      t.timestamps
    end

    add_index 'ra.county_codes', :code, unique: true
  end
end
