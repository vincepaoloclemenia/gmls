class Api::RfqItemsController < ApplicationController
   before_filter :set_rfq_item, only: [:show, :update, :destroy]

  def index
    @rfq_items = RfqItem.all
    
    if params[:rfq_id]
      @rfq_items = @rfq_items.where(rfq_id: params[:rfq_id])
    end

    render json: @rfq_items
  end

  def create
    @rfq_item = RfqItem.new(rfq_item_params)
    @rfq_item.department = current_user.department
    if @rfq_item.save
      render json: @rfq_item, status: :created, rfq_item: [:api, @rfq_item]
    else
      render json: { errors: @rfq_item.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @rfq_item.update(rfq_item_params)
      head :no_content
    else
      render json: { errors: @rfq_item.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @rfq_item.destroy

    head :no_content
  end

  private

  def set_rfq_item
    @rfq_item = RfqItem.find(params[:id])
  end

  def rfq_item_params
    params.require(:rfq_item).permit(:rfq_id, :item_id, :ui, :start_date, :end_date, :days, :unit_price, :total_price, :description, :quantity, :name, :item_type, :department, :stat, :item_location_price_id)
  end

end
