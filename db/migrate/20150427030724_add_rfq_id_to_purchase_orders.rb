class AddRfqIdToPurchaseOrders < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :rfq_id, :integer
    add_index :purchase_orders, :rfq_id
  end
end
