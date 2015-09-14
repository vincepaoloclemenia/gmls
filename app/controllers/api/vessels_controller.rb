  class Api::VesselsController < ApplicationController
    before_filter :set_vessel, only: [:update, :destroy, :edit]

    def index
      # @vessels = current_user.department.nil? ? Vessel.all : Vessel.where(department: current_user.department)
      # render json: @vessels
      remove_search_space
      @q = Vessel.ransack(params[:q])
      @vessels = @q.result.paginate(:page => params[:page], :per_page => 4)
    end

    def create
      @vessel = Vessel.new(vessel_params)
      @vessel.department = current_user.department
      if @vessel.save
        # render json: @vessel, status: :created, vessel: [:api, @vessel]
        redirect_to api_vessels_path, notice: 'Entry created'
      else
        # render json: { errors: @vessel.errors }, status: :unprocessable_entity
        redirect_to new_api_vessel_path, alert: @vessel.errors.full_messages.first
      end
    end

    def update
      if @vessel.update(vessel_params)
        # head :no_content
        redirect_to api_vessels_path, notice: 'Entry updated'
      else
        redirect_to edit_api_vessel_path, alert: @vessel.errors.full_messages.first
      end
    end

    def new
      @vessel = Vessel.new
    end
    
    def destroy
      @vessel.destroy
      redirect_to api_vessels_path, notice: 'Entry successfully deleted'
      # head :no_content
    end

    def remove_search_space
      unless params["q"].nil?
        params["q"]["name_cont"].strip!
        params["q"]["flag_of_registry_cont"].strip!
        params["q"]["owner_operator_cont"].strip!
        params["q"]["vessel_type_name_cont"].strip!
        params["q"]["type_of_service_cont"].strip!
      end
    end

    private

    def set_vessel
      @vessel = Vessel.find(params[:id])
    end

    def vessel_params
      params.require(:vessel).permit(:name, :vessel_class_id, :vessel_type_id, :flag_of_registry, :owner_operator, :grt, :nrt, :dwt, :loa, :service_speed, :conference, :type, :type_of_service, :num_of_booms, :capacity_boom, :type_of_boom, :num_of_hatches, :type_of_hatch, :boom_cycle, :customs_reg_number, :voyage_num, :vessel_type_name, :department)
    end
    
  end