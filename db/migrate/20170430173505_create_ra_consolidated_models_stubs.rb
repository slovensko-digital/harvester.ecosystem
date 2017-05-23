class CreateRaConsolidatedModelsStubs < ActiveRecord::Migration[5.0]
  def change
    create_table 'ra.regions' do |t|
      t.timestamps
    end

    create_table 'ra.counties' do |t|
      t.timestamps
    end

    create_table 'ra.municipalities' do |t|
      t.timestamps
    end

    create_table 'ra.districts' do |t|
      t.timestamps
    end

    create_table 'ra.street_names' do |t|
      t.timestamps
    end

    create_table 'ra.property_registration_numbers' do |t|
      t.timestamps
    end

    create_table 'ra.building_numbers' do |t|
      t.timestamps
    end

    create_table 'ra.building_units' do |t|
      t.timestamps
    end
  end
end
