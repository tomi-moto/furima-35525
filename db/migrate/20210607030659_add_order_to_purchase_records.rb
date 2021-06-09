class AddOrderToPurchaseRecords < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchase_records, :order, null: false, foreign_key: true
  end
end
