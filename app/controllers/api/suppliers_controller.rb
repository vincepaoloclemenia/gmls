class Api::SuppliersController < ApplicationController
   before_filter :set_supplier, only: [:show, :update, :destroy, :edit]

  def index
    #@suppliers = current_user.department.nil? ? Supplier.all : Supplier.where(department: current_user.department)
    # @suppliers = Supplier.includes(:supplier_category, :location).all
    category_name_cont
    @q = Supplier.ransack(params[:q])
    @suppliers = @q.result.paginate(:page => params[:page], :per_page => 10)
    # render json: @suppliers
  end

  def create
    @supplier = Supplier.new(supplier_params)
    @supplier.department = current_user.department
    if @supplier.save
      # render json: @supplier, status: :created, supplier: [:api, @supplier]
      redirect_to api_suppliers_path, notice: 'Entry created'
    else
      redirect_to new_api_supplier_path, alert: @supplier.errors.full_messages.first
      # render json: { errors: @supplier.errors }, status: :unprocessable_entity
    end
  end

  def new
    @supplier = Supplier.new
  end

  def update
    if @supplier.update(supplier_params)
      redirect_to api_suppliers_path, notice: 'Entry updated'
    else
      redirect_to edit_api_supplier_path, alert: @supplier.errors.full_messages.first
    end
  end
  
  def destroy
    @supplier.destroy
    redirect_to api_suppliers_path, notice: 'Entry successfully deleted'
  end
 
  def category_name_cont
    unless params["q"].nil?
      params["q"]["name_cont"].strip!
      params["q"]["telephone_number_cont_any"].strip!
      params["q"]["email_cont"].strip!
    end
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    params["supplier"]["name"].strip!
    params.require(:supplier).permit(:name, :email, :department, :contact_person, :fax_number, :telephone_number, :mobile_number, :address, :supplier_category_id, :location_id)
  end

end
