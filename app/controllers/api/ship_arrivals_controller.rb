class Api::ShipArrivalsController < ApplicationController
  before_filter :set_ship_arrival, only: [:update, :destroy]

  def index
    @ship_arrivals = current_user.department.nil? ? ShipArrival.all : ShipArrival.where(department: current_user.department)
    render json: @ship_arrivals
  end

  def create
    @ship_arrival = ShipArrival.new(ship_arrival_params)
    @ship_arrival.department = current_user.department
    if @ship_arrival.save
      render json: @ship_arrival, status: :created, ship_arrival: [:api, @ship_arrival]
    else
      render json: { errors: @ship_arrival.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @ship_arrival.update(ship_arrival_params)
      head :no_content
    else
      render json: { errors: @ship_arrival.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @ship_arrival.destroy

    head :no_content
  end

  private

  def set_ship_arrival
    @ship_arrival = ShipArrival.find(params[:id])
  end

  def ship_arrival_params
    params.require(:ship_arrival).permit(:shipname, :vessel_class_id, :date_arriving, :time_arriving, :date_assigned, :user_id, :department)
  end

end
