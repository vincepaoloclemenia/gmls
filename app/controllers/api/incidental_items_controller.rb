class Api::IncidentalItemsController < ApplicationController
  before_filter :set_incidental_item, only: [:update, :destroy, :show]

  def index
    # @incidental_items = current_user.department.nil? ? IncidentalItem.all : IncidentalItem.where(department: current_user.department)
    @incidental_items = IncidentalItem.all
    render json: @incidental_items
  end

  def create
    @incidental_item = IncidentalItem.new(incidental_item_params)
    @incidental_item.department = current_user.department
    if @incidental_item.save
      render json: @incidental_item, status: :created, incidental_item: [:api, @incidental_item]
    else
      render json: { errors: @incidental_item.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @incidental_item.update(incidental_item_params)
      head :no_content
    else
      render json: { errors: @incidental_item.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @incidental_item.destroy

    head :no_content
  end

  private

  def set_incidental_item
    @incidental_item = IncidentalItem.find(params[:id])
  end

  def incidental_item_params
    params.require(:incidental_item).permit(:incidental_quote_id, :item_id, :area, :price, :remarks, :department)
  end
end
