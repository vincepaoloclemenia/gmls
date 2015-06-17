class Api::ItemLocationPricesController < ApplicationController
  before_filter :set_item_location_price, only: [:show, :update, :destroy]

  def index
    @item_location_prices = ItemLocationPrice.where(item_id: params[:item_id])
    render json: @item_location_prices
  end

  def show
    render json: @item_location_price
  end

  def create
    @item_location_price = ItemLocationPrice.new(item_location_price_params)

    if @item_location_price.save
      render json: @item_location_price, status: :created, item: [:api, @item_location_price]
    else
      render json: { errors: @item_location_price.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @item_location_price.update(item_location_price_params)
      head :no_content
    else
      render json: { errors: @item_location_price.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @item_location_price.destroy

    head :no_content
  end

  private

  def set_item_location_price
    @item_location_price = ItemLocationPrice.find(params[:id])
  end

  def item_location_price_params
    params.require(:item_location_price).permit(:item_id, :price, :origin, :destination)
  end
 
end
