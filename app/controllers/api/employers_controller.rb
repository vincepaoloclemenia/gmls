class Api::EmployersController < ApplicationController
  before_filter :set_employer, only: [:show, :update, :destroy, :edit]

  def index
    # @employers = current_user.department.nil? ? Employer.all : Employer.where(department: current_user.department)
    # render json: @employers
    unless params["q"].nil?
      params["q"]["owner_contact_person_cont_any"].strip!
      params["q"]["mobile_no_cont_any"].strip!
    end
    @q = Employer.ransack(params[:q])
    @employers = @q.result.paginate(:page => params[:page], :per_page => 10)
    # @employers = Employer.all
  end

  def create
    @employer = Employer.new(employer_params)
    if @employer.owner_contact_person != " "
      if @employer.save
        redirect_to api_employers_path, notice: 'Entry created'
      else
        render json: { errors: @employer.errors }, status: :unprocessable_entity
      end
    else
      redirect_to new_api_employer_path, alert: 'Incorrect entry'
    end
  end

  def update
    if @employer.update(employer_params)
      redirect_to api_employers_path, notice: 'Entry Updated'
    else
      redirect_to edit_api_employer_path(@employer), alert: 'Please provide the right input.'
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
    params["employer"]["owner_contact_person"].strip!
    params.require(:employer).permit(:owner_contact_person, :mobile_no)
  end
end
