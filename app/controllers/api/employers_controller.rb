class Api::EmployersController < ApplicationController
  before_filter :set_employer, only: [:show, :update, :destroy, :edit]

  def index
    # @employers = current_user.department.nil? ? Employer.all : Employer.where(department: current_user.department)
    # @q = Employer.ransack(params[:q])
    # @employers = @q.result.paginate(:page => params[:page], :per_page => 10)
    # render json: @employers
    @q = Employer.ransack(params[:q])
    @employers = @q.result.paginate(:page => params[:page], :per_page => 5)
    # @employers = Employer.all
  end

  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      redirect_to api_employers_path, notice: 'Entry created'
    else
      render json: { errors: @employer.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @employer.update(employer_params)
      redirect_to api_employers_path, notice: 'Entry Updated'
    else
      render json: { errors: @employer.errors }, status: :unprocessable_entity
    end
  end
  
  def new
    @employer = Employer.new
  end

  def destroy
    @employer.destroy
    redirect_to api_employers_path, notice: 'Entry successfully deleted'
  end

  private

  def set_employer
    @employer = Employer.find(params[:id])
  end
    
  def employer_params
    params.require(:employer).permit(:owner_contact_person, :mobile_no)
  end
end
