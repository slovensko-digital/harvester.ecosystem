class CreateRaChangesBatches < ActiveRecord::Migration[5.0]
  def change
    create_table 'ra.changes_batches' do |t|
      t.datetime :generated_at, null: false

      t.timestamps
    end
  end
end
