class Api::ServicesController < ApplicationController
	before_filter :set_service, only: [:show, :update, :destroy, :edit]

  def index
    # @services = current_user.department.nil? ? Service.all : Service.where(department: current_user.department)
    @services = Service.paginate(:page => params[:page], :per_page => 10)
    # render json: @services
  end

  def create
    @service = Service.new(service_params)
    @service.department = current_user.department
    if @service.save
      # render json: @service, status: :created, service: [:api, @service]
      redirect_to api_services_path, notice: 'Entry created'
    else
      redirect_to @service, alert: @service.errors.full_messages.first
      # render json: { errors: @service.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @service.update(service_params)
      redirect_to api_services_path, notice: 'Entry updated'
    else
      render json: { errors: @service.errors }, status: :unprocessable_entity
    end
  end
  
  def new
    @service = Service.new
  end

  def destroy
    @service.destroy
    redirect_to api_services_path, notice: 'Entry successfully deleted'
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :description, :department)
  end
end
