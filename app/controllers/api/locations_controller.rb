class Api::LocationsController < ApplicationController
  before_filter :set_location, only: [:show, :update, :destroy, :edit]

  def index
    # @locations = current_user.department.nil? ? Location.all : Location.where(department: current_user.department)
    #with ransack seraching
    category_name_cont
    @q = Location.ransack(params[:q])
    @locations = @q.result.paginate(:page => params[:page], :per_page => 10)

  end

  def create
    @location = Location.new(location_params)
    @location.department = current_user.department
    
    if @location.save
      # render json: @location, status: :created, location: [:api, @location]
      redirect_to api_locations_path, notice: 'Entry created'
    else
      # render json: { errors: @location.errors }, status: :unprocessable_entity
      redirect_to new_api_location_path, alert: @location.errors.full_messages.first
    end
  end

  def new
    @location = Location.new
  end

  def update
    if @location.update(location_params)
      redirect_to api_locations_path, notice: 'Entry updated'
    else
      redirect_to edit_api_location_path, alert: @location.errors.full_messages.first
    end
  end
  
  def destroy
    @location.destroy
    redirect_to api_locations_path, notice: 'Entry was successfully deleted'
  end

  def category_name_cont
    unless params["q"].nil?
      params["q"]["name_cont"].strip!
    end
  end  

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params["location"]["name"].strip!
    params.require(:location).permit(:name, :location_type, :region, :address, :department)
  end
end
