class Api::VehiclesController < ApplicationController
  before_filter :set_vehicle, only: [:show, :update, :destroy, :edit]

  def index
    # inclusion of ransack
    @q = Vehicle.ransack(params[:q])
    @vehicles = @q.result.includes(:employer, :driver).paginate(:page => params[:page], :per_page => 10)

  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.department = current_user.department
    if @vehicle.save
      redirect_to api_vehicles_path, notice: 'Entry created'
    else
      # render json: { errors: @location.errors }, status: :unprocessable_entity
      redirect_to api_vehicles_path, alert: @vehicle.errors.full_messages.first
    end
  end
  
  def show
    render json: @vehicle
  end

  def new
    @vehicle = Vehicle.new
  end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to api_vehicles_path, notice: 'Entry updated'
    else
      render json: { errors: @vehicle.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @vehicle.destroy
    redirect_to api_vehicles_path, notice: 'Entry was successfully deleted'
  end
  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end
    
  def vehicle_params
    params.require(:vehicle).permit(:name, :mobile_number, :plate_number, :employer_id, :driver_id, :vehicle_type)
    raise
  end
 
end
