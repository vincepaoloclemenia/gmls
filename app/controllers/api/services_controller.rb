class Api::ServicesController < ApplicationController
	before_filter :set_service, only: [:show, :update, :destroy]

  def index
    @services = current_user.department.nil? ? Service.all : Service.where(department: current_user.department)
    render json: @services
  end

  def create
    @service = Service.new(service_params)
    @service.department = current_user.department
    if @service.save
      render json: @service, status: :created, service: [:api, @service]
    else
      render json: { errors: @service.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @service.update(service_params)
      head :no_content
    else
      render json: { errors: @service.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @service.destroy

    head :no_content
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :description, :department)
  end
end
