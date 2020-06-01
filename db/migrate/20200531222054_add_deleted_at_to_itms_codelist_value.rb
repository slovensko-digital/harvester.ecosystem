class AddDeletedAtToItmsCodelistValue < ActiveRecord::Migration[5.0]
  def change
    add_column 'itms.hodnoty_ciselnikov', :deleted_at, :datetime
  end
end
