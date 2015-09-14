class Api::NavyTypesController < ApplicationController
  before_filter :set_navy_type, only: [:update, :destroy, :edit]

  def index
    # @navy_types = current_user.department.nil? ? NavyType.all : NavyType.where(department: current_user.department)
    clear_search_space
    @q = NavyType.ransack(params[:q])
    @navy_types = @q.result.paginate(:page => (params[:page]), :per_page => 10)
    # render json: @navy_types
  end

  def create
    @navy_type = NavyType.new(navy_type_params)
    @navy_type.department = current_user.department
    if @navy_type.save
      # render json: @navy_type, status: :created, navy_type: [:api, @navy_type]
      redirect_to api_navy_types_path, notice: 'Entry created'
    else
      # render json: { errors: @navy_type.errors }, status: :unprocessable_entity
      redirect_to new_api_navy_type_path, alert: @navy_type.errors.full_messages.first
    end
  end

  def update
    if @navy_type.update(navy_type_params)
      # head :no_content
      redirect_to api_navy_types_path, notice: 'Entry updated'
    else
      redirect_to edit_api_navy_type_path, alert: @navy_type.errors.full_messages.first
    end
  end
  
  def new
    @navy_type = NavyType.new
  end

  def destroy
    @navy_type.destroy
    redirect_to api_navy_types_path, notice: 'Entry successfully deleted'
    # head :no_content
  end

  def clear_search_space
    unless params["q"].nil?
      params["q"]["name_cont"].strip!
    end
  end
  
  private

  def set_navy_type
    @navy_type = NavyType.find(params[:id])
  end

  def navy_type_params
    params.require(:navy_type).permit(:name, :department)
  end
end
