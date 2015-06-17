class Api::LogreqResponsesController < ApplicationController
  before_filter :set_logreq_response, only: [:show, :update, :destroy]

  def index
    # @logreq_responses = current_user.department.nil? ? LogreqResponse.all : LogreqResponse.where(department: current_user.department)
    @logreq_responses = LogreqResponse.all
    render json: @logreq_responses
  end

  def create
    @logreq_response = LogreqResponse.new(logreq_response_params)
    # @logreq_response.department = current_user.department
    if @logreq_response.save
      render json: @logreq_response, status: :created, logreq_response: [:api, @logreq_response]
    else
      render json: { errors: @logreq_response.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @logreq_response.update(logreq_response_params)
      head :no_content
    else
      render json: { errors: @logreq_response.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @logreq_response.destroy

    head :no_content
  end
  private

  def set_logreq_response
    @logreq_response = LogreqResponse.find(params[:id])
  end
    
  def logreq_response_params
    params.require(:logreq_response).permit(:logreq_id, :question, :response)
  end
end
