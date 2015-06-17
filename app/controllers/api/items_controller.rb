class Api::ItemsController < ApplicationController
   before_filter :set_item, only: [ :update, :destroy]
   before_filter :set_item_with_eager_load, only: [:show]

  def index
    @items = current_user.department.nil? ? Item.all : Item.where(department: current_user.department)
    render json: @items
  end

  def show
    render json: @item
  end

  def create
    @item = Item.new(item_params)
    @item.department = current_user.department

    if @item.save
      render json: @item, status: :created, item: [:api, @item]
    else
      render json: { errors: @item.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      head :no_content
    else
      render json: { errors: @item.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @item.destroy

    head :no_content
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_item_with_eager_load
    @item = Item.includes(:item_location_prices, :supplier_items, :item_prices).find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category_id, :sub_category_id, :unit_price, :package_size, :unit_of_issue, :item_type, :category_name, :sub_category_name, :item_prices, :rate, :description,:service_type, :department)
  end

end
