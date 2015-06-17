class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      
      t.integer :supplier_id
      t.string  :attention
      t.date    :date_created
      t.date    :delivery_date
      t.string  :payment_terms
      t.text    :remarks
      t.string  :deliver_to
      t.integer :prepared_by
      t.string  :payment_terms
      t.string  :purchase_order_number
      t.timestamps null: false
    end

    add_index :purchase_orders, :supplier_id
  end
end
