class Api::PrincipalsController < ApplicationController
  before_filter :set_principal, only: [:show, :update, :destroy, :edit]

  def index
    unless params["q"].nil? 
      params["q"]["name_cont"].strip!
      params["q"]["contact_number_cont_any"].strip!
      params["q"]["email_cont_any"].strip!
      params["q"]["point_of_contact_cont_any"].strip!
    end
    @q = Principal.ransack(params[:q])
    @principals = @q.result.paginate(:page => params[:page], :per_page => 10)
    # render json: @principals
  end

  def create
    @principal = Principal.new(principal_params)
    @principal.department = current_user.department
    if @principal.save
      # render json: @principal, status: :created, principal: [:api, @principal]
      redirect_to api_principals_path, notice: 'Entry created'
    else
      # render json: { errors: @principal.errors }, status: :unprocessable_entity
      redirect_to api_principals_path, alert: @principal.errors.full_messages.first
    end
  end

  def new
    @principal = Principal.new
  end

  def update
    if @principal.update(principal_params)
      # head :no_content
      redirect_to api_principals_path, notice: 'Entry updated'
    else
      # render json: { errors: @principal.errors }, status: :unprocessable_entity
      render json: { errors: @principal.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @principal.destroy
    # head :no_content
    redirect_to api_principals_path, notice: 'Entry was successfully deleted'
  end

  private

  def set_principal
    @principal = Principal.find(params[:id])
  end

  def principal_params
    params.require(:principal).permit(:name, :contact_number, :email, :point_of_contact, :address, :department)
  end
  
end