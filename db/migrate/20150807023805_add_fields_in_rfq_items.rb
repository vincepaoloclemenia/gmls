class AddFieldsInRfqItems < ActiveRecord::Migration
  def change
  	add_column :rfq_items, :supplier_id, :integer
  	add_column :rfq_items, :is_approved, :string, default: false
  	add_column :rfq_items, :is_rejected, :string, default: false
  	add_column :rfq_items, :supplier_pricing, :decimal, precision: 8, scale: 2
  end
end