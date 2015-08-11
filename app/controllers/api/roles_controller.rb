class Api::RolesController < ApplicationController
  before_filter :set_role, only: [:show, :update, :destroy, :manage, :edit]

  def index
    @roles = Role.order("id DESC")
    # render json: @roles
  end

  def create
    @role = Role.new(role_params)
    @role.department = current_user.department
    if @role.save
      # render json: @role, status: :created, role: [:api, @role]
      redirect_to api_roles_path, notice: 'Entry created'
    else
      redirect_to @role, alert: @role.errors.full_messages.first
      # render json: { errors: @role.errors }, status: :unprocessable_entity
    end
  end
  
  def show
    render json: @role
  end

  def manage
    render json: @role
  end

  def new
    @role = Role.new
  end

  def update
    if @role.update(role_params)
      # head :no_content
      redirect_to api_roles_path, notice: 'Entry updated'
    else
      render json: { errors: @role.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @role.destroy
    redirect_to api_roles_path, notice: 'Entry successfully deleted'
  end
  private

  def set_role
    @role = Role.find(params[:id])
  end
    
  def role_params
    params.require(:role).permit(:id, :role_name, :description, :department, :access_level)
  end
end
