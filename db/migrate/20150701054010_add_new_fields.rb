class AddNewFields < ActiveRecord::Migration
  def change
  	add_column :incidental_items, :supplier_pricing_detail_id, :integer
  end
end
