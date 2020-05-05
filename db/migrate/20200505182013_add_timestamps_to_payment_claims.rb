class AddTimestampsToPaymentClaims < ActiveRecord::Migration[5.0]
  def change
    add_timestamps 'itms.zop', null: true

    long_ago = DateTime.new(2000, 1, 1)
    Itms::PaymentClaim.update_all(created_at: long_ago, updated_at: long_ago)

    change_column_null 'itms.zop', :created_at, false
    change_column_null 'itms.zop', :updated_at, false
  end
end
