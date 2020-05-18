class AddDeletedAtToItmsBudgetItem < ActiveRecord::Migration[5.0]
  def change
    add_column 'itms.polozky_rozpoctu', :deleted_at, :datetime
  end
end
