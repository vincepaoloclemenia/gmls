class Api::PurchaseOrdersController < ApplicationController
  before_filter :set_purchase_order, only: [:show, :update, :destroy, :edit]

  def index
    @purchase_orders = current_user.department.nil? ? PurchaseOrder.all : PurchaseOrder.where(department: current_user.department)
  end

  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    @purchase_order.department = current_user.department
    
    if @purchase_order.save
      # render json: @purchase_order, status: :created, rfq_item: [:api, @purchase_order]
      redirect_to api_purchase_orders_path(step: 4), notice: 'Entry created'
    else
      render json: { errors: @purchase_order.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @purchase_order.update(purchase_order_params)
      redirect_to api_purchase_orders_path(step: 4), notice: 'Entry updated'
    else
      render json: { errors: @purchase_order.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @purchase_order.destroy
    redirect_to api_purchase_orders_path(step: 4), notice: 'Entry successfully deleted'
  end

  def new
    @purchase_order = PurchaseOrder.new
    @supplier = Supplier.find params[:supplier_id]
  end

  def show
    @supplier = Supplier.find @purchase_order.supplier_id
    @items = IncidentalItem.where({ incidental_quote_id: @purchase_order.incidental_quote_id, supplier_id: @purchase_order.supplier_id })
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf         => "Purchase Order Logreq",
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

  def edit
    @supplier = Supplier.find params[:supplier_id]
  end

  private

  def set_purchase_order
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  def purchase_order_params
    params.require(:purchase_order).permit(:rfq_id,:supplier_id, :attention, :date_created, :delivery_date, :payment_terms, :remarks, :deliver_to, :prepared_by, :payment_terms, :purchase_order_number, :incidental_quote_id)
  end
end
