class Api::ContractItemsController < ApplicationController
  before_filter :set_contract_item, only: [:update, :destroy, :show]

  def index
    # @contract_items = current_user.department.nil? ? ContractItem.all : ContractItem.where(department: current_user.department)
    @contract_items = ContractItem.all
    render json: @contract_items
  end

  def create
    @contract_item = ContractItem.new(contract_item_params)
    @contract_item.department = current_user.department
    if @contract_item.save
      render json: @contract_item, status: :created, contract_item: [:api, @contract_item]
    else
      render json: { errors: @contract_item.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @contract_item.update(contract_item_params)
      head :no_content
    else
      render json: { errors: @contract_item.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @contract_item.destroy

    head :no_content
  end

  private

  def set_contract_item
    @contract_item = ContractItem.find(params[:id])
  end

  def contract_item_params
    params.require(:contract_item).permit(:contract_id, :item_no, :schedule_of_supplies, :quantity, :unit, :unit_price, :amount, :department)
  end
end