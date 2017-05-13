class RaAddEffectiveOnToMunicipalityChanges < ActiveRecord::Migration[5.0]
  def change
    add_column 'ra.municipality_changes', 'effective_on', :date
  end
end
