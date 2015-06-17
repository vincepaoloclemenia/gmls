class AddDepartmentToPurchaseOrders < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :department, :integer
  end
end
