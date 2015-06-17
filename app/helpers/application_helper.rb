module ApplicationHelper

	def icon_text(icon, text)
    raw("<span class='glyphicon glyphicon-#{icon}'></span> #{text}")
  end
  
end
