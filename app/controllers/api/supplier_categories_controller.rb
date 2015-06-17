class Api::SupplierCategoriesController < ApplicationController
  before_action :set_supplier_category, only: [:show, :edit, :update, :destroy]

  def index
    @supplier_categories = SupplierCategory.all
    render json: @supplier_categories
  end

  def create
    @supplier_category = SupplierCategory.new(supplier_category_params)
    if @supplier_category.save
      render json: @supplier_category, status: :created, supplier_category: [:api, @supplier_category]
    else
      render json: { errors: @supplier_category.errors }, status: :unprocessable_entity
    end
  end
  
  def show
    render json: @supplier_category
  end

  def update
    if @supplier_category.update(supplier_category_params)
      head :no_content
    else
      render json: { errors: @supplier_category.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @supplier_category.destroy

    head :no_content
  end

  private
    def set_supplier_category
      @supplier_category = SupplierCategory.find(params[:id])
    end

    def supplier_category_params
      params.require(:supplier_category).permit(:name)
    end
end
