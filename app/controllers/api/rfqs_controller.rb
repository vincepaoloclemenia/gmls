class Api::RfqsController < ApplicationController
  before_filter :set_rfq, only: [:update, :destroy, :edit]
  before_filter :set_rfq_eager_load, only: [:show]
  

  def index
    @rfqs = current_user.department.nil? ? Rfq.all : Rfq.where(department: current_user.department)
    # render json: @rfqs
  end

  def create
    @rfq = Rfq.new(rfq_params)
    @rfq.department = current_user.department
    if @rfq.save
      # render json: @rfq, status: :created, rfq: [:api, @rfq]
      redirect_to api_rfqs_path(step: 1), notice: 'Entry created'
    else
      render json: { errors: @rfq.errors }, status: :unprocessable_entity
    end
  end
  
  def show
    # render json: @rfq
  end

  def new
    @rfq = Rfq.new
  end

  def update
    if @rfq.update(rfq_params)
      redirect_to api_rfqs_path(step: 1), notice: 'Entry updated'
    else
      render json: { errors: @rfq.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @rfq.destroy
    redirect_to api_rfqs_path(step: 1), notice: 'Entry successfully deleted'
  end

  private

  def set_rfq
    @rfq = Rfq.find(params[:id])
  end

  def set_rfq_eager_load
    @rfq = Rfq.includes(rfq_items: [:item], rfq_supplier_items:[:item, :supplier]).find(params[:id])
  end

  def rfq_params
    params.require(:rfq).permit(:title, :principal_id, :cage_code, :duns, :step, :sub_step, :department, :principal_name, :is_awarded, :requirements_officer_id, :monitoring_officer_id, :monitoring_officer_name, :requirements_officer_name)
  end

end
