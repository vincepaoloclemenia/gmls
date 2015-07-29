class PagesController < ApplicationController
  def list_supplier_items_per_price
		@supplier_pricing_details = SupplierPricingDetail.where(item_id: params[:item_id])
		return @supplier_pricing_details
  end

  def change_subcategory
  	@subcategories = SubCategory.where(category_id: params[:category_id])
		return @subcategories
  end
end
