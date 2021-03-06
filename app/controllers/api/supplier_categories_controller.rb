class Api::SupplierCategoriesController < ApplicationController
  before_action :set_supplier_category, only: [:show, :edit, :update, :destroy, :edit]

  def index
    # @supplier_categories = SupplierCategory.all
    @q = SupplierCategory.ransack(params[:q])
    @supplier_categories = @q.result.paginate(:page => params[:page], :per_page => 10)
    # render json: @supplier_categories
  end

  def create
    @supplier_category = SupplierCategory.new(supplier_category_params)
    if @supplier_category.save
      # render json: @supplier_category, status: :created, supplier_category: [:api, @supplier_category]
      redirect_to api_supplier_categories_path, notice: 'Entry created'
    else
      redirect_to new_api_supplier_category_path, alert: @supplier_category.errors.full_messages.first
      # render json: { errors: @supplier_category.errors }, status: :unprocessable_entity
    end
  end
  
  def show
    render json: @supplier_category
  end

  def update
    if @supplier_category.update(supplier_category_params)
      # head :no_content
      redirect_to api_supplier_categories_path, notice: 'Entry updated'
    else
      redirect_to edit_api_supplier_category_path, alert: @supplier_category.errors.full_messages.first
    end
  end
  
  def new
    @supplier_category = SupplierCategory.new
  end

  def destroy
    @supplier_category.destroy
    redirect_to api_supplier_categories_path, notice: 'Entry successfully deleted'
    # head :no_content
  end

  def category_name_cont
    unless params["q"].nil?
      params["q"]["name_cont"].strip!
    end
  end

  private
    def set_supplier_category
      @supplier_category = SupplierCategory.find(params[:id])
    end

    def supplier_category_params
      params["supplier_category"]["name"].strip!
      params.require(:supplier_category).permit(:name)
    end
end


