class AddIsApprovedAndIsRejectedToRfqSupplierItems < ActiveRecord::Migration
  def change
    add_column :rfq_supplier_items, :is_approved, :boolean, :default => false
    add_column :rfq_supplier_items, :is_rejected, :boolean, :default => false   

  	add_index :rfq_supplier_items, :supplier_id
  	add_index :rfq_supplier_items, :item_id
  	add_index :rfq_supplier_items, :rfq_id
    
  end
end
