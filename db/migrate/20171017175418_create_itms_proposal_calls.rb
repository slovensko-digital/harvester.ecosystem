class CreateItmsProposalCalls < ActiveRecord::Migration[5.0]
  def change
    create_table 'itms.vyzvy' do |t|
      t.integer :itms_id, null: false, index: { unique: true}
      #TODO: finish
      t.timestamps
    end
  end
end
