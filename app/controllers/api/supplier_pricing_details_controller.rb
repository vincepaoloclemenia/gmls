class Api::SupplierPricingDetailsController < ApplicationController
  before_action :set_supplier_pricing_detail, only: [:show, :edit, :update, :destroy, :edit]

  def index
    # @supplier_pricing_details = SupplierPricingDetail.all
    category_name_cont
    @q = SupplierPricingDetail.ransack(params[:q])
    @supplier_pricing_details = @q.result.includes(:supplier, :service, :item, :incidental_items).paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @supplier_pricing_detail = SupplierPricingDetail.new(supplier_pricing_detail_params)
    if @supplier_pricing_detail.save
      redirect_to api_supplier_pricing_details_path, notice: 'Entry created'
    else
      redirect_to @supplier_pricing_detail, alert: @supplier_pricing_detail.errors.full_messages.first
    end
  end
  
  def show
    render json: @supplier_pricing_detail
  end

  def update
    if @supplier_pricing_detail.update(supplier_pricing_detail_params)
      redirect_to api_supplier_pricing_details_path, notice: 'Entry updated'
    else
      render json: { errors: @supplier_pricing_detail.errors }, status: :unprocessable_entity
    end
  end
  
  def new
    @supplier_pricing_detail = SupplierPricingDetail.new
  end

  def destro0
    @supplier_pricing_detail.destroy
    redirect_to api_supplier_pricing_details_path, notice: 'Entry successfully deleted'
  end

  def category_name_cont
    unless params["q"].nil?
      params["q"]["supplier_name_cont"].strip!
      params["q"]["service_type_cont"].strip!
      params["q"]["item_name_cont"].strip!
      params["q"]["price_eq"].strip!
      params["q"]["unit_cont"].strip!
      params["q"]["quantity_eq"].strip!
    end
  end

  private
    def set_supplier_pricing_detail
      @supplier_pricing_detail = SupplierPricingDetail.find(params[:id])
    end

    def supplier_pricing_detail_params
      params.require(:supplier_pricing_detail).permit(:supplier_id, :service_id, :item_id, :tool_id, :type, :price, :unit, :service_type, :quantity, :type_name)
    end
end
