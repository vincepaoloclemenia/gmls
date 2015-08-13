class Api::SuppliersController < ApplicationController
   before_filter :set_supplier, only: [:show, :update, :destroy, :edit]

  def index
    #@suppliers = current_user.department.nil? ? Supplier.all : Supplier.where(department: current_user.department)
    # @suppliers = Supplier.includes(:supplier_category, :location).all
    @suppliers = Supplier.paginate(:page => params[:page], :per_page => 10)
    # render json: @suppliers
  end

  def create
    @supplier = Supplier.new(supplier_params)
    @supplier.department = current_user.department
    if @supplier.save
      # render json: @supplier, status: :created, supplier: [:api, @supplier]
      redirect_to api_suppliers_path, notice: 'Entry created'
    else
      redirect_to @supplier, alert: @supplier.errors.full_messages.first
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
      render json: { errors: @supplier.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @supplier.destroy
    redirect_to api_suppliers_path, notice: 'Entry successfully deleted'
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(:name, :email, :department, :contact_person, :fax_number, :telephone_number, :mobile_number, :address, :supplier_category_id, :location_id)
  end

end
