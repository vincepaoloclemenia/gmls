class Api::PurchaseOrderItemsController < ApplicationController
  before_filter :set_purchase_order_item, only: [:show, :update, :destroy]
     
  def index
     @purchase_order_items = PurchaseOrderItem.all
   
    if params[:purchase_order_id]
      @purchase_order_items = @purchase_order_items.where(purchase_order_id: params[:purchase_order_id])
    end 
    render json: @purchase_order_items
  end

  def create
    @purchase_order_item = PurchaseOrderItem.new(purchase_order_item_params)
    if @purchase_order_item.save
      render json: @purchase_order_item, status: :created, rfq_item: [:api, @purchase_order_item]
    else
      render json: { errors: @purchase_order_item.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @purchase_order_item.update(purchase_order_item_params)
      head :no_content
    else
      render json: { errors: @purchase_order_item.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @purchase_order_item.destroy

    head :no_content
  end

  private

  def set_purchase_order_item
    @purchase_order_item = PurchaseOrderItem.find(params[:id])
  end

  def purchase_order_item_params
    params.require(:purchase_order_item).permit(:purchase_order_id, :item_id, :quantity, :uom, :unit_price, :discount, :amount)
  end

end
