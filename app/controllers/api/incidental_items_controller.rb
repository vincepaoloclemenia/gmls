class Api::IncidentalItemsController < ApplicationController
  before_filter :set_incidental_item, only: [:update, :destroy, :show, :edit, :update_supplier]
  autocomplete :item, :name
  def index
    # @incidental_items = current_user.department.nil? ? IncidentalItem.all : IncidentalItem.where(department: current_user.department)
    @incidental_quote = IncidentalQuote.find(params[:incidental_quote_id])
    @incidental_items = IncidentalItem.where(incidental_quote_id: params[:incidental_quote_id])
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf         => "Incidental Quotation Form",
              :orientation  => 'Portrait',
              :page_width   => '13in',
              :margin => {:top       => 35,
                          :bottom   => 30,
                          :left => 0,
                          :right => 0},
              :header => { :html => { :template => 'api/logreqs/header.pdf.slim' }},
              :footer => { :html => { :template => 'api/logreqs/footer.pdf.slim' }}
      end
    end
  end

  def create
    @incidental_item = IncidentalItem.new(incidental_item_params)
    @incidental_item.department = current_user.department
    if @incidental_item.save
      if params[:incidental_item][:logreq_id].present?
        redirect_to services_breakdown_api_incidental_quotes_path(li: params[:incidental_item][:logreq_id], step: 2), notice: 'Entry created'
      else
        redirect_to api_incidental_items_path(incidental_quote_id: @incidental_item.incidental_quote_id, step: 2), notice: 'Entry created'
      end  
    else
      render json: { errors: @incidental_item.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @incidental_item.update(incidental_item_params)
      redirect_to api_incidental_items_path(incidental_quote_id: @incidental_item.incidental_quote_id, step: 2), notice: 'Entry updated'
    else
      # render json: { errors: @incidental_item.errors }, status: :unprocessable_entity
    end
  end
  
  def new
    @incidental_item = IncidentalItem.new
    respond_to do |format|
      format.html # show.html.erb
      format.js 
    end
  end

  def destroy
    @incidental_item.destroy
    redirect_to request.referrer, notice: 'Entry successfully deleted'
  end

  def choose_supplier
    @incidental_quote = IncidentalQuote.find(params[:incidental_quote_id])
    @logreq_detail = Logreq.find @incidental_quote.logreq_id
    @incidental_items = IncidentalItem.where(incidental_quote_id: params[:incidental_quote_id])
    @supplier_count = IncidentalItem.where(incidental_quote_id: params[:incidental_quote_id]).pluck(:supplier_id)
  end

  def update_supplier
    @incidental_item.update_attributes(supplier_id: params[:supplier_id])
    redirect_to request.referrer, notice: 'The supplier has already been selected for this item.'
  end

  def choose_supplier_listings
    if params[:q].nil? 
      params[:q] = {}
      params[:q][:updated_at] = ""
    end
    @q = IncidentalQuote.ransack(params[:q])
    @incidental_quotes = @q.result.paginate(:page => (params[:page]), :per_page => 10)
  end

  def list_supplier_per_items
    @supplier_pricing_details = SupplierPricingDetail.where(item_id: params[:item_id])
  end

  def build_purchase_order
    @supplier_ids = IncidentalItem.select("supplier_id").where(incidental_quote_id: params[:incidental_quote_id]).distinct("supplier_id").pluck(:supplier_id)
    @incidental_items = IncidentalItem.where(incidental_quote_id: params[:incidental_quote_id])
  end

  def select_incidental_items
    @incidental_item = IncidentalItem.new
    @logreq = Logreq.find params[:li]
    @incidental_items = IncidentalItem.where({logreq_id: params[:li], incidental_quote_id: nil})
    @service_ids = IncidentalItem.where(logreq_id: params[:li]).distinct.pluck(:service_id)
  end

  def include_incidental_item
    @incidental_item = IncidentalItem.find(params[:incidental_item_id])
    @incidental_item.update_attributes(:incidental_quote_id => params[:incidental_quote_id])
    redirect_to request.referrer, notice: 'The item has been included in the quotation.'
  end

  def exclude_incidental_item
    @incidental_item = IncidentalItem.find(params[:incidental_item_id])
    @incidental_item.update_attributes(:incidental_quote_id => nil)
    redirect_to request.referrer, notice: 'The item has been included in the quotation.'
  end


  def update_price_incidental_item
    @incidental_item = IncidentalItem.find(params[:incidental_item_id])
    @supplier_pricing_details = SupplierPricingDetail.where(item_id: @incidental_item.item_id )
  end

  def update_pricing
    @incidental_item = IncidentalItem.find(params[:incidental_item_id])
    @incidental_item.update_attributes(:price => params[:pr])
    redirect_to api_incidental_items_path(li: params[:li], step: 2, incidental_quote_id: params[:incidental_quote_id]), notice: 'The price item has been updated.'
  end

  private

  def set_incidental_item
    @incidental_item = IncidentalItem.find(params[:id])
  end

  def incidental_item_params
    params.require(:incidental_item).permit(:incidental_quote_id, :item_id, :area, :price, :remarks, :department, :supplier_pricing_detail_id, :supplier_id, :location_id, :quantity, :unit, :tariff_code, :logreq_id, :service_id)
  end
end
