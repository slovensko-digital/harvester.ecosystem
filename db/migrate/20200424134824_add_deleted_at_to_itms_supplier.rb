class AddDeletedAtToItmsSupplier < ActiveRecord::Migration[5.0]
  def change
    add_column 'itms.dodavatelia', :deleted_at, :datetime
  end
end
