class RemoveOrderIdFromPurchaseRecord < ActiveRecord::Migration[6.0]
  def change
    remove_reference :purchase_records, :order, null: false, foreign_key: true
  end
end
