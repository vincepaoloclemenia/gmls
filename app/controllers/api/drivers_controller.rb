class Api::DriversController < ApplicationController
	before_filter :set_driver, only: [:show, :update, :destroy, :edit]

  def index
    # @drivers = current_user.department.nil? ? Driver.all : Driver.where(department: current_user.department)
    unless params["q"].nil?
      params["q"]["name_cont"].strip!
      params["q"]["contact_no_cont_any"].strip!
      params["q"]["employer_owner_contact_person_cont"].strip!
    end
    @q = Driver.ransack(params[:q])
    @drivers = @q.result.includes(:employer).paginate(:page => (params[:page]), :per_page => 10)
  end

  def create
    @driver = Driver.new(driver_params)
    
    if @driver.save
      # render json: @driver, status: :created, driver: [:api, @driver]
      redirect_to api_drivers_path, notice: 'Entry created'
    else
      redirect_to new_api_driver_path, alert: @driver.errors.full_messages.to_sentence
      # render json: { errors: @driver.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @driver.update(driver_params)
      redirect_to api_drivers_path, notice: 'Entry updated'
    else
      redirect_to edit_api_driver_path, alert: @driver.errors.full_messages.to_sentence
      # render json: { errors: @driver.errors }, status: :unprocessable_entity
    end
  end

  def new
    @driver = Driver.new
  end
  
  def destroy
    @driver.destroy
    redirect_to api_drivers_path, notice: 'Entry successfully deleted'
  end

  private 
  def set_driver
    @driver = Driver.find(params[:id])
  end
    
  def driver_params
    # raise
    params.require(:driver).permit(:name, :contact_no, :employer_id)
  end
end

