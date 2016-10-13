class CreateRaBuildingTypes < ActiveRecord::Migration[5.0]
  def change
    create_table 'ra.building_types' do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
