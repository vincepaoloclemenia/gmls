class Api::RolesController < ApplicationController
  before_filter :set_role, only: [:show, :update, :destroy, :manage]

  def index
    @roles = current_user.department.nil? ? Role.all : Role.where(department: current_user.department)
    render json: @roles
  end

  def create
    @role = Role.new(role_params)
    @role.department = current_user.department
    if @role.save
      render json: @role, status: :created, role: [:api, @role]
    else
      render json: { errors: @role.errors }, status: :unprocessable_entity
    end
  end
  
  def show
    render json: @role
  end

  def manage
    render json: @role
  end

  def update
    if @role.update(role_params)
      head :no_content
    else
      render json: { errors: @role.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @role.destroy

    head :no_content
  end
  private

  def set_role
    @role = Role.find(params[:id])
  end
    
  def role_params
    params.require(:role).permit(:id, :role_name, :description, :department)
  end
end
