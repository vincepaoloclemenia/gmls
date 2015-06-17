class CreateItemLocationPrices < ActiveRecord::Migration
  def change
    create_table :item_location_prices do |t|
      t.integer :item_id
      t.decimal :price, precision: 8, scale: 2
      t.string :origin
      t.string :destination

      t.timestamps null: false
    end
  end
end
