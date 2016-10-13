class CreateRaDistrictCodes < ActiveRecord::Migration[5.0]
  def change
    create_table 'ra.district_codes' do |t|
      t.string :code
      t.string :name, null: false

      t.timestamps
    end

    add_index 'ra.district_codes', [:code, :name], unique: true
  end
end
