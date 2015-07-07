class CreateSupplierPricingDetails < ActiveRecord::Migration
  def change
    create_table :supplier_pricing_details do |t|
    	t.integer :supplier_id
    	t.integer :service_id
    	t.integer :item_id
    	t.integer :tool_id
    	t.string  :type
    	t.decimal :price, precision: 8, scale: 2
    	t.string  :unit
      t.timestamps null: false
    end

    add_column :vehicles, :plate_number, :string
    add_column :logreqs, :ending_text, :text
  end
end
