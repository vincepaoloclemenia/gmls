class CreatePurchaseOrderItems < ActiveRecord::Migration
  def change
    create_table :purchase_order_items do |t|
      
      t.integer :purchase_order_id
      t.integer :item_id
      t.integer :quantity
      t.string  :uom
      t.decimal :unit_price
      t.decimal :discount
      t.decimal :amount

      t.timestamps null: false
    end

    add_index :purchase_order_items, :item_id
    add_index :purchase_order_items, :purchase_order_id

  end
end
