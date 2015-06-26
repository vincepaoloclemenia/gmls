module ApplicationHelper

	def icon_text(icon, text)
    raw("<span class='glyphicon glyphicon-#{icon}'></span> #{text}")
  end
  
  def current(val)
  	if val.to_s == params[:step]
  		return 'current'
  	end
  end
end


