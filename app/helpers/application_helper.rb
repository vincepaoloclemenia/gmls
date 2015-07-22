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

  def show_supplier_info(supplier_id)
    @supplier = Supplier.find supplier_id
  end

  def per_supplier_pricing_detail(item_id, supplier_id)
    @pricing_detail = SupplierPricingDetail.where({item_id: item_id, supplier_id: supplier_id})
  end

  def full_name(user_id)
    @user = User.find user_id
    "#{@user.first_name} #{@user.last_name}"
  end

  def list_quotes(logreq_id)
    IncidentalQuote.where(logreq_id: logreq_id)
  end
end


