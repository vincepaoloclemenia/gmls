class Api::RoleManagementsController < ApplicationController
  before_filter :set_role_management, only: [:show, :update, :destroy]

  def index
    @role_managements = current_user.department.nil? ? RoleManagement.all : RoleManagement.where(department: current_user.department)
    render json: @role_managements
  end

  def create
    @role_management = RoleManagement.new(role_management_params)
    @role_management.department = current_user.department
    if @role_management.save
      render json: @role_management, status: :created, role_management: [:api, @role_management]
    else
      render json: { errors: @role_management.errors }, status: :unprocessable_entity
    end
  end
  
  def show
    render json: @role_management
  end

  def update
    if @role_management.update(role_management_params)
      head :no_content
    else
      render json: { errors: @role_management.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @role_management.destroy

    head :no_content
  end
  private

  def set_role_management
    @role_management = RoleManagement.find(params[:id])
  end
    
  def role_management_params
    params.require(:role_management).permit(:id, :role_id, :module_name, :can_create, :can_delete, :can_edit, :can_view, :department)
  end
end