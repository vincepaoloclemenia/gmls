class Api::GovernmentAgenciesController < ApplicationController
  before_filter :set_government_agency, only: [:show, :update, :destroy]

  def index
    @government_agencys = current_user.department.nil? ? GovernmentAgency.all : GovernmentAgency.where(department: current_user.department)
    render json: @government_agencys
  end

  def create
    @government_agency = GovernmentAgency.new(government_agency_params)
    @government_agency.department = current_user.department
    if @government_agency.save
      render json: @government_agency, status: :created, government_agency: [:api, @government_agency]
    else
      render json: { errors: @government_agency.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @government_agency.update(government_agency_params)
      head :no_content
    else
      render json: { errors: @government_agency.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @government_agency.destroy

    head :no_content
  end

  private

  def set_government_agency
    @government_agency = GovernmentAgency.find(params[:id])
  end

  def government_agency_params
    params.require(:government_agency).permit(:department_or_division, :contact_person, :mobile_number, :telephone, :fax, :email, :address, :department)
  end

end
