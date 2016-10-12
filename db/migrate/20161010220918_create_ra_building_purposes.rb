class CreateRaBuildingPurposes < ActiveRecord::Migration[5.0]
  def change
    create_table 'ra.building_purposes' do |t|
      t.string :code, null: false
      t.string :name, null: false

      t.timestamps
    end

    add_index 'ra.building_purposes', :code, unique: true
  end
end
