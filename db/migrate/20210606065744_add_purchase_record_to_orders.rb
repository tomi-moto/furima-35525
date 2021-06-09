class AddPurchaseRecordToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :purchase_record, null: false, foreign_key: true
  end
end
