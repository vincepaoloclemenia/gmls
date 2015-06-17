class CreateSupplierItems < ActiveRecord::Migration
  def change
    create_table :supplier_items do |t|
      t.integer :supplier_id
      t.decimal :price, precision: 8, scale: 2
      t.integer :item_id
      t.text :remarks

      t.timestamps null: false
    end
  end
end
