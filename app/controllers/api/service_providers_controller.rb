class Api::ServiceProviderProvidersController < ApplicationController
	before_filter :set_service_provider, only: [:show, :update, :destroy]

  def index
    @service_providers = current_user.department.nil? ? ServiceProvider.all : ServiceProvider.where(department: current_user.department)
    render json: @service_providers
  end

  def create
    @service_provider = ServiceProvider.new(service_provider_params)
    @service_provider.department = current_user.department
    if @service_provider.save
      render json: @service_provider, status: :created, service_provider: [:api, @service_provider]
    else
      render json: { errors: @service_provider.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @service_provider.update(service_provider_params)
      head :no_content
    else
      render json: { errors: @service_provider.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @service_provider.destroy

    head :no_content
  end

  private
  
  def set_service_provider
    @service_provider = ServiceProvider.find(params[:id])
  end

  def service_provider_params
    params.require(:service_provider).permit(:name, :contact_person, :mobile_number, :telephone, :fax, :address, :email, :department)
  end
end
