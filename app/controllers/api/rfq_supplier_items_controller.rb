class Api::RfqSupplierItemsController < ApplicationController
  before_filter :set_rfq_supplier_item, only: [:show, :update, :destroy]

  def index 
    
    if params[:rfq_id]
      @rfq_supplier_items = RfqSupplierItem.where(rfq_id: params[:rfq_id]).eager_load(:supplier, :item).order('item_id desc')
    end

    if params[:rfq_id] and params[:is_approved]
      @rfq_supplier_items = RfqSupplierItem.where(rfq_id: params[:rfq_id], is_approved: params[:is_approved]).eager_load(:supplier, :item).order('item_id desc')
    end

    render json: @rfq_supplier_items
  end

  def create
    @rfq_supplier_item = RfqSupplierItem.new(rfq_supplier_item_params)
    
    if @rfq_supplier_item.save
      render json: @rfq_supplier_item, status: :created, supplier: [:api, @rfq_supplier_item]
    else
      render json: { errors: @rfq_supplier_item.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @rfq_supplier_item.update(rfq_supplier_item_params)
      head :no_content
    else
      render json: { errors: @rfq_supplier_item.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @rfq_supplier_item.destroy

    head :no_content
  end

  private

  def set_rfq_supplier_item
    @rfq_supplier_item = RfqSupplierItem.find(params[:id])
  end

  def rfq_supplier_item_params
    params.require(:rfq_supplier_item).permit(:item_id, :supplier_id, :price, :rfq_id, :is_approved, :is_rejected)
  end

end
