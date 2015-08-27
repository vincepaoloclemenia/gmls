class Api::PurchaseOrdersController < ApplicationController
  before_filter :set_purchase_order, only: [:show, :update, :destroy, :edit]

  def index
    if params[:q].nil?
      params[:q] = {}
      params[:q][:date_created_eq] = ""
      params[:q][:delivery_date_eq] = ""
    end
    @q = PurchaseOrder.ransack(params[:q])
    @purchase_orders = current_user.department.nil? ? @q.result.includes(:supplier) : @q.result.includes(:supplier).where(department: current_user.department).paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    @purchase_order.department = current_user.department
    raise
    if @purchase_order.save
      if purchase_order_params["rfq_id"].nil?
        redirect_to api_purchase_orders_path(step: 4), notice: 'Entry created'
      else
        redirect_to rfq_purchase_order_api_purchase_orders_path(step: 3), notice: 'Entry created'
      end
    else
      render json: { errors: @purchase_order.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @purchase_order.update(purchase_order_params)
      if purchase_order_params["rfq_id"].nil?
        redirect_to api_purchase_orders_path(step: 4), notice: 'Entry updated'
      else  
        redirect_to list_rfq_build_po_api_purchase_orders_path(rfq_id: purchase_order_params["rfq_id"], step: 3), notice: 'Entry created'
      end
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

  def rfq_purchase_order
    @list_rfqs = Rfq.all
  end

  def create_rfq_po
    @purchase_order = PurchaseOrder.new
    @rfq = Rfq.find params[:rfq_id]
  end

  def rfq_build_po
    @rfq = Rfq.find params[:rfq_id]
    @list_suppliers = RfqItem.where(rfq_id: @rfq.id).distinct.pluck(:supplier_id)
    @rfq_items = RfqItem.where(rfq_id: @rfq.id)
  end

  def list_rfq_build_po
    @purchase_orders = PurchaseOrder.where(rfq_id: params[:rfq_id])
  end

  def rfq_edit
    @purchase_order = PurchaseOrder.find params[:purchase_order_id]
  end  

  private

  def set_purchase_order
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  def purchase_order_params
    params.require(:purchase_order).permit(:rfq_id,:supplier_id, :attention, :date_created, :delivery_date, :payment_terms, :remarks, :deliver_to, :prepared_by, :payment_terms, :purchase_order_number, :incidental_quote_id)
  end
end
