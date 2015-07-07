module ApplicationHelper

	def icon_text(icon, text)
    raw("<span class='glyphicon glyphicon-#{icon}'></span> #{text}")
  end
  
  def current(val)
  	if val.to_s == params[:step]
  		return 'current'
  	end
  end

  def item_per_supplier(item_id)
  	@supplier_pricing_details = SupplierPricingDetail.where(item_id: item_id)
  end

  def count_incidental_items(incidental_quote_id)
  	@incidental_items = IncidentalItem.where(incidental_quote_id: incidental_quote_id)
  	@incidental_items.count
  end
end


