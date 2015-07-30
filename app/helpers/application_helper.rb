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

  def per_supplier_pricing_detail_price(supplier_id, item_id)
    @price = SupplierPricingDetail.select("price").where({item_id: item_id, supplier_id: supplier_id}).last
    @price.nil? ? 0 : @price
  end

  def quotation_format(logreq_id)
    @logreq = Logreq.find logreq_id
    @logreq_id = IncidentalQuote.select(:id).last

    if @logreq_id.nil? || 0 
      @logreq_id = 1
    else
      @logreq_id = @logreq_id
    end

    @year = @logreq.date_of_arrival.strftime("%y")
    @month = @logreq.date_of_arrival.strftime("%m")
    @day_1 = @logreq.date_of_arrival.strftime("%d")
    @day_2 = @logreq.date_of_departure.strftime("%d")
    @id = @logreq_id.id.to_i
    @id = @id + 1
    @n = "%07d" % @id
    return @year.to_s+'-'+@month.to_s+'-'+@day_1.to_s+'-'+@day_2.to_s+'-'+@n.to_s
    
  end

  def principal_name(logreq_id)
    @logreq = Logreq.find logreq_id
    @logreq.principal.name
  end

  def service_name(service_id)
    @x = Service.select('name').find service_id
    @x.name
  end
end

# :date_of_arrival, :date_of_departure, :pier, :user_id, :ending_text, :principal_id

