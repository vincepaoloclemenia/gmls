class PagesController < ApplicationController
  def change_subcategory
  	# @subcategories = SubCategory.find(:all, :conditions => { :category_id => params[:category_id] } )
  	# raise
  end

  def list_supplier_items_per_price
		@supplier_pricing_details = SupplierPricingDetail.where(item_id: params[:item_id])
		return @supplier_pricing_details
  end
end
