class AddDatumUhradyAndSchvalenaSumaToZopUhradene < ActiveRecord::Migration[5.0]
  def change
    add_column 'itms.zop_uhradene', :datum_uhrady, :datetime
    add_column 'itms.zop_uhradene', :schvalena_suma, :integer
  end
end
