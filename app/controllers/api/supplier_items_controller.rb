class Api::SupplierItemsController < ApplicationController
  
  before_filter :set_supplier_item, only: [:show, :update, :destroy]

  def index
    #@supplier_items = current_user.department.nil? ? SupplierItem.all : SupplierItem.where(department: current_user.department)
    if params[:supplier_id]
      @supplier_items = SupplierItem.where(supplier_id: params[:supplier_id]).eager_load(:supplier, :item)
    end
  
    if params[:item_id]
      @supplier_items = SupplierItem.where(item_id: params[:item_id]).eager_load(:supplier, :item).order('supplier_id desc')
    end
    render json: @supplier_items
  end

  def create
    @supplier_item = SupplierItem.new(supplier_item_params)
    @supplier_item.department = current_user.department
    if @supplier_item.save
      render json: @supplier_item, status: :created, supplier: [:api, @supplier_item]
    else
      render json: { errors: @supplier_item.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @supplier_item.update(supplier_item_params)
      head :no_content
    else
      render json: { errors: @supplier_item.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @supplier_item.destroy

    head :no_content
  end

  private

  def set_supplier_item
    @supplier_item = SupplierItem.find(params[:id])
  end

  def supplier_item_params
    params.require(:supplier_item).permit(:item_id, :supplier_id, :price, :remarks, :item_name, :item_type, :department, :supplier_name)
  end
end
