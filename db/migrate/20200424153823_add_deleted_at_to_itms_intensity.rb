class AddDeletedAtToItmsIntensity < ActiveRecord::Migration[5.0]
  def change
    add_column 'itms.intenzity', :deleted_at, :datetime
  end
end
