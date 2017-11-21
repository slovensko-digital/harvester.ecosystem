class AddItmsForeignKeyForSpecificGoalActivityTypes < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key 'itms.konkretne_ciele_typy_aktivit', 'itms.typy_aktivit', column: :typ_aktivity_id
  end
end
