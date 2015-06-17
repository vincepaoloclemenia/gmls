class Api::LogreqsController < ApplicationController
  before_filter :set_logreq, only: [:show, :update, :destroy, :show]

  def index
    @logreqs = current_user.department.nil? ? Logreq.all : Logreq.where(department: current_user.department)
    render json: @logreqs
  end

  def create
    @logreq = Logreq.new(logreq_params)
    @logreq.department = current_user.department
    if @logreq.save
      render json: @logreq, status: :created, logreq: [:api, @logreq]
    else
      render json: { errors: @logreq.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @logreq.update(logreq_params)
      head :no_content
    else
      render json: { errors: @logreq.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @logreq.destroy

    head :no_content
  end

  def show
    render json: @logreq
  end
  
  private

  def set_logreq
    @logreq = Logreq.find(params[:id])
  end
    
  def logreq_params
    params.require(:logreq).permit(:shipname, :entry_date, :information, :department, :logreg_info, :vessel_id, :vessel_class_name, :date_of_arrival, :date_of_departure, :pier)
  end
end
