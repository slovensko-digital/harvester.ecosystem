class RaDropUniqueIndicesForCodesTables < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      SET search_path = ra;

      DROP INDEX "index_ra.region_codes_on_code";
      DROP INDEX "index_ra.county_codes_on_code";
      DROP INDEX "index_ra.district_codes_on_code";
      DROP INDEX "index_ra.municipality_codes_on_code";
      DROP INDEX "index_ra.building_purpose_codes_on_code";
      DROP INDEX "index_ra.building_type_codes_on_code";

      SET search_path TO "$user", public;
    SQL
  end
  def down
    add_index 'ra.region_codes', :code, unique: true
    add_index 'ra.county_codes', :code, unique: true
    add_index 'ra.district_codes', :code, unique: true
    add_index 'ra.municipality_codes', :code, unique: true
    add_index 'ra.building_purpose_codes', :code, unique: true
    add_index 'ra.building_type_codes', :code, unique: true
  end
end
