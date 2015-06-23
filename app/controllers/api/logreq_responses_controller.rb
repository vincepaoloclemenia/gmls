class Api::LogreqResponsesController < ApplicationController
  before_filter :set_logreq_response, only: [:show, :update, :destroy, :edit]

  def index
    # @logreq_responses = current_user.department.nil? ? LogreqResponse.all : LogreqResponse.where(department: current_user.department)
    @logreq = Logreq.find(params[:logreq_id])
    @logreq_responses = LogreqResponse.where(logreq_id: @logreq.id)
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf         => "Logreq Response",
              :orientation  => 'Portrait',
              :page_width   => '13in',
              :margin => {:top       => 2,
                           :bottom   => 4}
      end
    end
  end

  def create
    @logreq_response = LogreqResponse.new(logreq_response_params)
    # @logreq_response.department = current_user.department
    if @logreq_response.save
      redirect_to api_logreq_responses_path(logreq_id: @logreq_response.logreq_id), notice: 'Entry created'
    else
      # render json: { errors: @principal.errors }, status: :unprocessable_entity
      redirect_to @logreq_response, alert: @logreq_response.errors.full_messages.first
    end
  end

  def update
    if @logreq_response.update(logreq_response_params)
      redirect_to api_logreq_responses_path(logreq_id: @logreq_response.logreq_id), notice: 'Entry updated'
    else
      render json: { errors: @logreq_response.errors }, status: :unprocessable_entity
    end
  end

  def new
    @logreq_response = LogreqResponse.new
  end

  def destroy
    @logreq_response.destroy
    redirect_to api_logreq_responses_path(logreq_id: @logreq_response), notice: 'Entry successfully deleted'
  end
  private

  def set_logreq_response
    @logreq_response = LogreqResponse.find(params[:id])
  end
    
  def logreq_response_params
    params.require(:logreq_response).permit(:logreq_id, :question, :response)
  end
end
