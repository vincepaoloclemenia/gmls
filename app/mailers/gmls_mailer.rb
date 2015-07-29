class GmlsMailer < ApplicationMailer
	default from: "globalmaritimesubic@gmail.com"
  
  def send_gmls_mailer
  	@my_email = 'reynan.albaredo@gmail.com'
  	mail(to: @my_email, subject: 'Creation of Logistic Requirements')	
  end
end
