class Api::LogreqItemsController < ApplicationController
   before_filter :set_logreq_item, only: [:show, :update, :destroy]

  def index
    @logreq_items = LogreqItem.all
    
    if params[:logreq_id]
      @logreq_items = @logreq_items.where(logreq_id: params[:logreq_id])
    end

    render json: @logreq_items
  end

  def create
    @logreq_item = LogreqItem.new(logreq_item_params)
    @logreq_item.department = current_user.department
    if @logreq_item.save
      render json: @logreq_item, status: :created, logreq_item: [:api, @logreq_item]
    else
      render json: { errors: @logreq_item.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @logreq_item.update(logreq_item_params)
      head :no_content
    else
      render json: { errors: @logreq_item.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @logreq_item.destroy

    head :no_content
  end

  private

  def set_logreq_item
    @logreq_item = LogreqItem.find(params[:id])
  end

  def logreq_item_params
    params.require(:logreq_item).permit(:logreq_id, :item_id, :ui, :start_date, :end_date, :days, :unit_price, :total_price, :description, :quantity, :name, :item_type, :department, :stat, :item_location_price_id)
  end

end
