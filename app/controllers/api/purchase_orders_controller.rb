class Api::PurchaseOrdersController < ApplicationController
  before_filter :set_purchase_order, only: [:show, :update, :destroy]

  def index
    @purchase_orders = current_user.department.nil? ? PurchaseOrder.all : PurchaseOrder.where(department: current_user.department)

    render json: @purchase_orders
  end

  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    @purchase_order.department = current_user.department
    if @purchase_order.save
      render json: @purchase_order, status: :created, rfq_item: [:api, @purchase_order]
    else
      render json: { errors: @purchase_order.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @purchase_order.update(purchase_order_params)
      head :no_content
    else
      render json: { errors: @purchase_order.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @purchase_order.destroy

    head :no_content
  end

  private

  def set_purchase_order
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  def purchase_order_params
    params.require(:purchase_order).permit(:rfq_id,:supplier_id, :attention, :date_created, :delivery_date, :payment_terms, :remarks, :deliver_to, :prepared_by, :payment_terms, :purchase_order_number)
  end
end
