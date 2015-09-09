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
    @logreq_id = IncidentalQuote.select(:id).order("id ASC").last

    if @logreq_id.nil? 
      @my_id = 1
    else
      @my_id = @logreq_id.id.to_i
    end

    @year = @logreq.date_of_arrival.strftime("%y")
    @month = @logreq.date_of_arrival.strftime("%m")
    @day_1 = @logreq.date_of_arrival.strftime("%d")
    @day_2 = @logreq.date_of_departure.strftime("%d")
    @id = @my_id
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

  def is_approver?
    if current_user.role.access_level == 'Approver'
      return true
    end
  end

  def is_encoder?
    if current_user.role.access_level == 'Data Encoder'
      return true
    end
  end

  def is_administrator?
    if current_user.role.access_level == 'Administrator'
      return true
    end
  end

  def rfq_req_officer(rfq_req_officer_id)
    if rfq_req_officer_id.nil?
      return 'Unassigned'
    else
      @officer = User.find rfq_req_officer_id
      return @officer.full_name
    end
  end

  def rfq_mon_officer(rfq_mon_officer_id)
    if rfq_mon_officer_id.nil?
      return 'Unassigned'
    else
      @officer = User.find rfq_mon_officer_id
      return @officer.full_name
    end
  end

  def supplier_name(supplier_id)
    @supplier = Supplier.find supplier_id
    @supplier.name
  end

  def po_listing_per_rfq(rfq_id)
    @entry = PurchaseOrder.where(rfq_id: rfq_id)
    if @entry.count.nil? || @entry.count == 0
      return false
    else
      return true
    end
  end

  def check_rfq_items(rfq_id)
    @items = RfqItem.where(rfq_id: rfq_id)
    @items.count
  end

  # def has_dups(array)
  #   unless array.uniq.length == array.length
  #     return 'true'
  #   else
  #     return 'false'
  #   end
  # end

  # def fib(n)
  #   case n
  #     when 0
  #       return 0
  #     when 1
  #       return 1
  #   else
  #     a = [0, 1]
  #     (2..n).each do |i|
  #       a << a[i-2].to_i + a[i-1].to_i
  #     end
  #     return a, a.last
  #   end
  # end


# >>>>>>> master
end
