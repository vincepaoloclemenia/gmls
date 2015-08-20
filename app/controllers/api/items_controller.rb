class Api::ItemsController < ApplicationController
   before_filter :set_item, only: [ :update, :destroy, :edit]
   before_filter :set_item_with_eager_load, only: [:show]

  def index
    # @items = current_user.department.nil? ? Item.all : Item.where(department: current_user.department)
    # render json: @items 
    @q = Item.ransack(params[:q])
    @items = @q.result.includes(:category, :sub_category).paginate(:page => params[:page], :per_page => 10)
    # @items = current_user.department.nil? ? Item.all.paginate(:page => params[:page], :per_page => 10) : Item.where(department: current_user.department).paginate(:page => params[:page], :per_page => 10)
    # render json: @items
  end

  def show
    render json: @item
  end

  def create
    @item = Item.new(item_params)
    @item.department = current_user.department

    if @item.save
      # render json: @item, status: :created, item: [:api, @item]
      redirect_to api_items_path, notice: 'Entry created'
    else
      # render json: { errors: @item.errors }, status: :unprocessable_entity
      redirect_to api_items_path, alert: @item.errors.full_messages.first
    end
  end

  def update
    if @item.update(item_params)
      redirect_to api_items_path, notice: 'Entry updated'
    else
      render json: { errors: @item.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @item.destroy
    redirect_to api_items_path, notice: 'Entry successfully deleted'
  end

  def new
    @item = Item.new
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_item_with_eager_load
    @item = Item.includes(:item_location_prices, :supplier_items, :item_prices).find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category_id, :sub_category_id, :unit_price, :package_size, :unit_of_issue, :item_type, :category_name, :sub_category_name, :rate, :description,:service_type, :department)
  end

end
