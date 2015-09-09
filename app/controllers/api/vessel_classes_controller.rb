class Api::VesselClassesController < ApplicationController
  before_filter :set_vessel_class, only: [:update, :destroy, :edit]

  def index
    # @vessel_classes = current_user.department.nil? ? VesselClass.all : VesselClass.where(department: current_user.department)
    # render json: @vessel_classes
    @q = VesselClass.ransack(params[:q])
    @vessel_classes = @q.result.paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @vessel_class = VesselClass.new(vessel_class_params)
    @vessel_class.department = current_user.department
    if @vessel_class.save
      # render json: @vessel_class, status: :created, vessel_class: [:api, @vessel_class]
      redirect_to api_vessel_classes_path, notice: 'Entry created'
    else
      # render json: { errors: @vessel_class.errors }, status: :unprocessable_entity
      redirect_to new_api_vessel_class_path, alert: @vessel_class.errors.full_messages.first
    end
  end

  def update
    if @vessel_class.update(vessel_class_params)
      redirect_to api_vessel_classes_path, notice: 'Entry updated'
    else
      redirect_to edit_api_vessel_class_path, alert: @vessel_class.errors.full_messages.first
    end
  end
  
  def new
    @vessel_class = VesselClass.new
  end

  def destroy
    @vessel_class.destroy
    redirect_to api_vessel_classes_path, notice: 'Entry was successfully deleted'
  end

  private

  def set_vessel_class
    @vessel_class = VesselClass.find(params[:id])
  end

  def vessel_class_params
    params.require(:vessel_class).permit(:name, :department)
  end

end
