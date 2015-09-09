class Api::VesselTypesController < ApplicationController
  before_filter :set_vessel_type, only: [:update, :destroy, :edit]

  def index
    # @vessel_types = current_user.department.nil? ? VesselType.all : VesselType.where(department: current_user.department)
    @q = VesselType.ransack(params[:q])
    @vessel_types = @q.result.includes(:vessel_class).paginate(:page => params[:page], :per_page => 10)
    # render json: @vessel_types
  end

  def create
    @vessel_type = VesselType.new(vessel_type_params)
    @vessel_type.department = current_user.department
    if @vessel_type.save
      # render json: @vessel_type, status: :created, vessel_type: [:api, @vessel_type]
      redirect_to api_vessel_types_path, notice: 'Entry created'
    else
      # render json: { errors: @vessel_type.errors }, status: :unprocessable_entity
      redirect_to new_api_vessel_type_path, alert: @vessel_type.errors.full_messages.first
    end
  end

  def update
    if @vessel_type.update(vessel_type_params)
      # head :no_content
      redirect_to api_vessel_types_path, notice: 'Entry updated'
    else
      redirect_to edit_api_vessel_type_path, alert: @vessel_type.errors.full_messages.first
      # render json: { errors: @vessel_type.errors }, status: :unprocessable_entity
    end
  end
  
  def new
    @vessel_type = VesselType.new
  end

  def destroy
    @vessel_type.destroy
    redirect_to api_vessel_types_path, notice: 'Entry successfully deleted'
  end

  private

  def set_vessel_type
    @vessel_type = VesselType.find(params[:id])
  end

  def vessel_type_params
    params.require(:vessel_type).permit(:name, :vessel_class_id, :description, :beam, :length, :crew_count, :draft, :displacement, :department)
  end
end
