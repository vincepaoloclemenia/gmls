class CreateRfqSupplierItems < ActiveRecord::Migration
  def change
    create_table :rfq_supplier_items do |t|
      t.integer :supplier_id
      t.integer :item_id
      t.integer :rfq_id
      t.decimal :price, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
