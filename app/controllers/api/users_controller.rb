class Api::UsersController < ApplicationController
  before_filter :set_user, only: [:show, :update, :destroy, :edit] 

  def index
    # @users = current_user.department.nil? ? User.all : User.where(department: current_user.department)
    # render json: @users
    @q = User.ransack(params[:q])
    @users = @q.result.paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      # render json: @user, status: :created, user: [:api, @user]
      redirect_to api_users_path, notice: 'Entry created'
    else
      redirect_to @user, alert: @user.errors.full_messages.first
      # render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      # head :no_content
      redirect_to api_users_path, notice: 'Entry updated'
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end
  
  def display_data
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf         => "Display_Data",
              :orientation  => 'Portrait',
              :page_width   => '13in',
              :margin => {:top       => 0,
                           :bottom   => 4}
      end
    end
  end
  def show
    render json: @user
  end

  def destroy
    @user.destroy
    redirect_to api_users_path, notice: 'Entry successfully deleted'
    # head :no_content
  end

  def new
    @user = User.new
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def set_user_from_token
      @user = User.find(params[:id])
    end
      
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :department, :position, :age, :gender, :role_id, :role_name, :full_name)
    end

end


    
