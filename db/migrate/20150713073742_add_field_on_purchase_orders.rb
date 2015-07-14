class AddFieldOnPurchaseOrders < ActiveRecord::Migration
  def change
  	add_column :purchase_orders, :incidental_quote_id, :integer
  end
end
