class Api::QualityQuestionnairesController < ApplicationController
  before_filter :set_quality_questionnaire, only: [:show, :update, :destroy]

  def index
    @quality_questionnaires = current_user.department.nil? ? QualityQuestionnaire.all : QualityQuestionnaire.where(department: current_user.department)
    render json: @quality_questionnaires
  end

  def create
    @quality_questionnaire = QualityQuestionnaire.new(quality_questionnaire_params)
    @quality_questionnaire.department = current_user.department
    if @quality_questionnaire.save
      render json: @quality_questionnaire, status: :created, quality_questionnaire: [:api, @quality_questionnaire]
    else
      render json: { errors: @quality_questionnaire.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @quality_questionnaire.update(quality_questionnaire_params)
      head :no_content
    else
      render json: { errors: @quality_questionnaire.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @quality_questionnaire.destroy

    head :no_content
  end
  private

  def set_quality_questionnaire
    @quality_questionnaire = QualityQuestionnaire.find(params[:id])
  end
    
  def quality_questionnaire_params
    params.require(:quality_questionnaire).permit(:port, :vessel_name, :port_visit_date, :field_prior_to_arrival, :field_upon_arrival, :field_during_the_port_call, :field_overall, :comments, :field_name, :field_signature, :field_date_signed, :department )
  end
end