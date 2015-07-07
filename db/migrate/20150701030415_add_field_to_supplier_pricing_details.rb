class AddFieldToSupplierPricingDetails < ActiveRecord::Migration
  def change
  	add_column :supplier_pricing_details, :type_name, :string
  end
end
