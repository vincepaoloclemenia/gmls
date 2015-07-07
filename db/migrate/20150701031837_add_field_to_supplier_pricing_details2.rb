class AddFieldToSupplierPricingDetails2 < ActiveRecord::Migration
  def change
  	remove_column :supplier_pricing_details, :type, :string
  	add_column :supplier_pricing_details, :service_type, :string
  end
end
