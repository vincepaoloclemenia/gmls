class PagesController < ApplicationController
  def list_supplier_items_per_price
		@supplier_pricing_details = SupplierPricingDetail.where(item_id: params[:item_id])
		return @supplier_pricing_details
  end

  def change_subcategory
  	@subcategories = SubCategory.where(category_id: params[:category_id])
		return @subcategories
  end

  def change_item
  	@item = Item.find params[:item_id]
		return @item
  end

  def dashboard
    @start_date = Date.today.beginning_of_month
    @end_date = Date.today.end_of_month
    @logreqs =  Logreq.where(date_of_arrival: @start_date..@end_date).order('date_of_arrival DESC')
  end
end