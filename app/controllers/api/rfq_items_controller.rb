class Api::RfqItemsController < ApplicationController
   before_filter :set_rfq_item, only: [:show, :update, :destroy, :edit]

  def index
    @rfq = Rfq.find params[:rfq_id]
    @add_rfq_item = RfqItem.new
    if params[:rfq_id]
      @rfq_items = RfqItem.where(rfq_id: params[:rfq_id])
    end

    # render json: @rfq_items
  end

  def create
    @rfq_item = RfqItem.new(rfq_item_params)
    @rfq_item.department = current_user.department
    if @rfq_item.save
      # render json: @rfq_item, status: :created, rfq_item: [:api, @rfq_item]
      redirect_to api_rfq_items_path(step: 1, rfq_id: params[:rfq_item][:rfq_id]), notice: 'Entry created'
    else
      render json: { errors: @rfq_item.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @rfq_item.update(rfq_item_params)
      # head :no_content
      redirect_to api_rfq_items_path(step: 1, rfq_id: params[:rfq_item][:rfq_id]), notice: 'Entry updated'
    else
      render json: { errors: @rfq_item.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @rfq_item.destroy
    redirect_to api_rfq_items_path(step: 1, rfq_id: params[:rfq_id]), notice: 'Entry successfully deleted.'
  end

  def choose_rfq_supplier
    @rfq_item = RfqItem.find params[:rfq_item_id]
    @supplier_items = SupplierPricingDetail.where(item_id: @rfq_item.item_id)
  end

  def update_selected_supplier
    @incidental_item = RfqItem.find(params[:rfq_item_id])
    @incidental_item.update_attributes(:supplier_id => params[:supplier_id])
    redirect_to request.referrer, notice: 'The supplier has been selected.'
  end

  private

  def set_rfq_item
    @rfq_item = RfqItem.find(params[:id])
  end

  def rfq_item_params
    params.require(:rfq_item).permit(:rfq_id, :item_id, :ui, :start_date, :end_date, :days, :unit_price, :total_price, :description, :quantity, :name, :item_type, :department, :stat, :item_location_price_id)
  end

end
