class Api::ItemPricesController < ApplicationController
   before_filter :set_item_price, only: [:show, :update, :destroy]

  def index
    #@item_prices = current_user.department.nil? ? ItemPrices.all : Item.where(department: current_user.department)
    if params[:item_id]
      @item_prices = ItemPrice.where(item_id: params[:item_id])
    end
    render json: @item_prices
  end

  def show
    render json: @item_price
  end

  def create
    @item_price = ItemPrice.new(item_price_params)
    @item_price.department = current_user.department

    if @item_price.save
      render json: @item_price, status: :created, item: [:api, @item_price]
    else
      render json: { errors: @item_price.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @item_price.update(item_price_params)
      head :no_content
    else
      render json: { errors: @item_price.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @item_price.destroy

    head :no_content
  end

  private

  def set_item_price
    @item = ItemPrice.find(params[:id])
  end

  def item_price_params
    params.require(:item_price).permit(:item_id, :price, :department)
  end

end

