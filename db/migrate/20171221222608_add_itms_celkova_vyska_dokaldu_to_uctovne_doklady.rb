class AddItmsCelkovaVyskaDokalduToUctovneDoklady < ActiveRecord::Migration[5.0]
  def change
    add_column 'itms.uctovne_doklady', :celkova_vyska_dokladu, :decimal
  end
end
