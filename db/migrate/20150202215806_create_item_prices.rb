class CreateItemPrices < ActiveRecord::Migration
  def change
    create_table :item_prices do |t|
      t.integer :item_id
      t.decimal :price, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
