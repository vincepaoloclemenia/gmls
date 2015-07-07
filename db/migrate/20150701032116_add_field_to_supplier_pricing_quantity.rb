class AddFieldToSupplierPricingQuantity < ActiveRecord::Migration
  def change
  	add_column :supplier_pricing_details, :quantity, :integer
  end
end
