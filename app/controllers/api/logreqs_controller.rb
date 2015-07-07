class Api::LogreqsController < ApplicationController
  before_filter :set_logreq, only: [:show, :update, :destroy, :show, :edit]

  def index
    @logreqs = current_user.department.nil? ? Logreq.all : Logreq.where(department: current_user.department)
    # render json: @logreqs
  end

  def create
    @logreq = Logreq.new(logreq_params)
    @logreq.department = current_user.department
    if @logreq.save
      # render json: @logreq, status: :created, logreq: [:api, @logreq]
      redirect_to api_logreqs_path(step: 1), notice: 'Entry created'
    else
      # render json: { errors: @principal.errors }, status: :unprocessable_entity
      redirect_to @logreq, alert: @logreq.errors.full_messages.first  
    end
  end

  def update
    if @logreq.update(logreq_params)
      redirect_to api_logreqs_path(step: 1), notice: 'Entry updated'
    else
      render json: { errors: @logreq.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @logreq.destroy
    redirect_to api_logreqs_path(step: 1), notice: 'Entry successfully deleted'
  end

  def new
    @logreq = Logreq.new
  end

  def show
    render json: @logreq
  end
  
  def ship_listings
    @ship_listings = Logreq.where("user_id is not ?", nil)
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf         => "Display_Data",
              :orientation  => 'Portrait',
              :page_width   => '13in',
              :margin => {:top       => 2,
                           :bottom   => 4}
      end
    end
  end

  # def display_data
  #   respond_to do |format|
  #     format.html
  #     format.pdf do
  #       render :pdf         => "Display_Data",
  #             :orientation  => 'Portrait',
  #             :page_width   => '13in',
  #             :margin => {:top       => 2,
  #                          :bottom   => 4}
  #     end
  #   end
  # end

  private

  def set_logreq
    @logreq = Logreq.find(params[:id])
  end
    
  def logreq_params
    params.require(:logreq).permit(:shipname, :entry_date, :information, :department, :logreg_info, :vessel_id, :vessel_class_name, :date_of_arrival, :date_of_departure, :pier, :user_id, :ending_text)
  end
end
