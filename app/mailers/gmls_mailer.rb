class GmlsMailer < ApplicationMailer
	default from: "globalmaritimesubic@gmail.com"
  
  def send_gmls_mailer(logreq_id, req_url)
  	@logreq_id = logreq_id
  	@req_url = req_url
  	@my_email = 'reynan.albaredo@gmail.com'
  	mail(to: @my_email, subject: 'Creation of Logistic Requirements')	
  end

  def send_mail_notification_status_change
  	@my_email = 'reynan.albaredo@gmail.com'
  	mail(to: @my_email, subject: 'Quotation Approval')
  end
end
