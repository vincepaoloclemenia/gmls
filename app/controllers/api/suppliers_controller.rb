class Api::SuppliersController < ApplicationController
   before_filter :set_supplier, only: [:show, :update, :destroy]

  def index
    #@suppliers = current_user.department.nil? ? Supplier.all : Supplier.where(department: current_user.department)
    @suppliers = Supplier.includes(:supplier_category, :location).all
    render json: @suppliers
  end

  def create
    @supplier = Supplier.new(supplier_params)
    @supplier.department = current_user.department
    if @supplier.save
      render json: @supplier, status: :created, supplier: [:api, @supplier]
    else
      render json: { errors: @supplier.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @supplier.update(supplier_params)
      head :no_content
    else
      render json: { errors: @supplier.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @supplier.destroy

    head :no_content
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(:name, :email, :department, :contact_person, :fax_number, :telephone_number, :mobile_number, :address, :supplier_category_id, :location_id)
  end

end
