class AddItemLocationPriceToRfqItems < ActiveRecord::Migration
  def change
    add_column :rfq_items, :item_location_price_id, :integer
    add_index :rfq_items, :item_location_price_id
  end
end
