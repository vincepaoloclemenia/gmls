class Api::RolesController < ApplicationController
  before_filter :set_role, only: [:show, :update, :destroy, :manage, :edit]

  def index
    # @roles = Role.order("id DESC") 
    @q = Role.ransack(params[:q])
    @roles = @q.result.paginate(:page => params[:page], :per_page => 10)
    # render json: @roles
  end

  def create
    @role = Role.new(role_params)
    @role.department = current_user.department
    if @role.save
      # render json: @role, status: :created, role: [:api, @role]
      redirect_to api_roles_path, notice: 'Entry created'
    else
      redirect_to new_api_role_path, alert: @role.errors.full_messages.first
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
      redirect_to new_api_role_path, alert: @role.errors.full_messages.first
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
    params["role"]["role_name"].strip!
    params.require(:role).permit(:id, :role_name, :description, :department, :access_level)
  end
end
