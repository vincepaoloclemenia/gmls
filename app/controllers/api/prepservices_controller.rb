class Api::PrepservicesController < ApplicationController
  before_filter :set_prepservice, only: [:update, :destroy]

  def index
    @prepservices = current_user.department.nil? ? Prepservice.all : Prepservice.where(department: current_user.department)
    render json: @prepservices
  end

  def create
    @prepservice = Prepservice.new(prepservice_params)
    @prepservice.department = current_user.department
    if @prepservice.save
      render json: @prepservice, status: :created, prepservice: [:api, @prepservice]
    else
      render json: { errors: @prepservice.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @prepservice.update(prepservice_params)
      head :no_content
    else
      render json: { errors: @prepservice.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @prepservice.destroy

    head :no_content
  end

  private

  def set_prepservice
    @prepservice = Prepservice.find(params[:id])
  end

  def prepservice_params
    params.require(:prepservice).permit(:vessel_name, :voy_no, :registry_no, :flag, :call_sign, :master, :operator,
      :regular_grt, :regular_nwt, :dwt, :beam, :loa, :year_built, :type_of_crane, :crane_capacity, :crane_hook_cycle,
      :no_of_hatches, :type_of_hatch_cover, :draft_fwd, :draft_aft, :type, :services_required, :discharging_term,
      :dangerous_cargo, :cargo_rse, :berthing_preference, :docking_side, :representative, :ship_agent, :address,
      :tel_no, :tug_assistance, :enclosure, :entry_date, :department )
  end

end
