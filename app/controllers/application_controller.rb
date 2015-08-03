class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :access_control

  private

  def access_control
  	# 0 - Military & 1 - Ship
  	return true if current_user.nil?
  	if current_user.department == 1
  		if params["controller"] == "api/rfqs"
  			redirect_to root_url, alert: "Access denied"
  		end
  	elsif current_user.department == 0
  		if params["controller"] == "api/logreqs"
  			redirect_to root_url, alert: "Acces denied"
  		end
  	else
  	end
  end
end
