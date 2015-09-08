class Api::LogreqsController < ApplicationController
  before_filter :set_logreq, only: [:show, :update, :destroy, :edit]

  def index
    if params[:q].nil?
      params[:q] = {}
      params[:q][:date_of_arrival_gteq] = ""
      params[:q][:date_of_departure_lteq] = ""
    end
    @q = Logreq.ransack(params[:q])
    @logreqs = @q.result.paginate(:page => params[:page], :per_page => 10)
    # @logreqs =  current_user.role.access_level == 'Approver' ? Logreq.order('id DESC') : Logreq.where(user_id: current_user.id).order('id DESC')
    # render json: @logreqs
  end

  def create
    @logreq = Logreq.new(logreq_params)
    @logreq.department = current_user.department
    if @logreq.save
      # render json: @logreq, status: :created, logreq: [:api, @logreq]
      GmlsMailer.send_gmls_mailer(@logreq.id, request.url).deliver
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
    # render json: @logreq
  end
  
  def ship_listings
    @ship_listings = Logreq.where("user_id is not ?", nil).order('id DESC')
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf         => "Display_Data",
              :orientation  => 'Portrait',
              :page_width   => '13in',
              :margin => {:top       => 35,
                          :bottom   => 30,
                          :left => 0,
                          :right => 0},
              :header => { :html => { :template => 'api/logreqs/header.pdf.slim' }},
              :footer => { :html => { :template => 'api/logreqs/footer.pdf.slim' }}
      end
    end
  end

  def delivery_reports
    index
  end

  def delivery_lists
    @logreq = Logreq.find params[:logreq_id]
    @delivery_lists = IncidentalQuote.where(logreq_id: params[:logreq_id]).pluck(:id)
    @delivery_reports = IncidentalItem.where(incidental_quote_id: @delivery_lists)
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf         => "Delivery Receipt",
              :orientation  => 'Portrait',
              :page_width   => '13in',
              :margin => {:top       => 35,
                          :bottom   => 30,
                          :left => 0,
                          :right => 0},
              :header => { :html => { :template => 'api/logreqs/header.pdf.slim' }},
              :footer => { :html => { :template => 'api/logreqs/footer.pdf.slim' }}
      end
    end
  end

  def disbursement_account
    @q = Logreq.ransack(params[:q])
    @logreqs = @q.result.paginate(:page => params[:page], :per_page => 10)
  end

  def anchorage_billings
    @logreq = Logreq.find params[:logreq_id]
    @delivery_lists = IncidentalQuote.where(logreq_id: params[:logreq_id]).pluck(:id)
    @delivery_reports = IncidentalItem.where(incidental_quote_id: @delivery_lists).order('id DESC')
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf         => "Anchorage Billing",
              :orientation  => 'Landscape',
              :page_width   => '13in',
              :margin => {:top       => 2,
                           :bottom   => 2}
      end
    end
  end

  def approved_logreq
    @logreq = Logreq.find params[:logreq_id]
    if params[:st] == '1'
      @logreq.update_attributes(:approved_logreq => 'Pending')
      redirect_to request.referrer, alert: 'The logistic requirement has been marked as Pending.'  
    else  
      @logreq.update_attributes(:approved_logreq => 'Approved')
      redirect_to request.referrer, notice: 'The logistic requirement has been marked as Approved.'
    end
    # GmlsMailer.send_mail_notification_status_change.deliver
    
  end

  def view_logreq
    @logreq = Logreq.find params[:logreq_id]
  end

  def assigned_user_breakdown_service_form
    @logreq = Logreq.find params[:li]
  end

  def assigned_user_breakdown_services
    @logreq = Logreq.find params[:li]
    @logreq.update_attributes(:assigned_user_breakdown_services => params[:logreq][:assigned_user_breakdown_services])
    # GmlsMailer.send_mail_notification_status_change(params[]).deliver
    redirect_to request.referrer, alert: 'The quotation has                                                                                                                                                                                                                                                                                                   been marked as Approved.'
  end
  
# def approved
#     @incidental_quote = IncidentalQuote.find(params[:incidental_quote_id])
#     @incidental_quote.update_attributes(:status => 'Approved')
#     GmlsMailer.send_mail_notification_status_change.deliver
#     redirect_to request.referrer, alert: 'The quotation has been marked as Approved.'
#   end
  private

  def set_logreq
    @logreq = Logreq.find(params[:id])
  end
    
  def logreq_params
    params.require(:logreq).permit(:shipname, :entry_date, :information, :department, :logreg_info, :vessel_id, :vessel_class_name, :date_of_arrival, :date_of_departure, :pier, :user_id, :ending_text, :principal_id, :approved_logreq, :approved_logreq_response, :assigned_user_breakdown_services, :pier_docking_location)
  end
end
