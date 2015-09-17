class Api::RfqsController < ApplicationController
  before_filter :set_rfq, only: [:update, :destroy, :edit]
  before_filter :set_rfq_eager_load, only: [:show]
  

  def strip_values(resource)
    resource.values.each { |r| r.strip! if r.present? }
  end

  def index
    # if params[:q].present?
    #   params[:q][:title_cont].strip! if params[:q][:title_cont].present?
    #   params[:q][:principal_name_cont].strip! if params[:q][:title_cont].present?
    #   params[:q][:duns_cont].strip! if params[:q][:duns_cont].present?
    #   params[:q][:cage_code_cont].strip! if params[:q][:cage_code_cont].present?
    # end
    strip_values(params[:q]) if params[:q].present?
    @q = Rfq.ransack(params[:q])
    @rfqs = current_user.department.nil? ? @q.result.paginate(:page => params[:page], :per_page => 10) : @q.result.where(department: current_user.department).paginate(:page => params[:page], :per_page => 10)
    # render json: @rfqs
  end

  def create
    @rfq = Rfq.new(rfq_params)
    @rfq.department = current_user.department
    if @rfq.save
      # render json: @rfq, status: :created, rfq: [:api, @rfq]
      redirect_to api_rfqs_path(step: 1), notice: 'Entry created'
    else
      render json: { errors: @rfq.errors }, status: :unprocessable_entity
    end
  end
  
  def show
    # render json: @rfq
  end

  def new
    @rfq = Rfq.new
  end

  def update
    if @rfq.update(rfq_params)
      if params['ds'] == 'true'
        redirect_to delegation_summary_api_rfqs_path(step: 2), notice: 'Entry updated'
      else  
        redirect_to api_rfqs_path(step: 1), notice: 'Entry updated'
      end
    else
      render json: { errors: @rfq.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @rfq.destroy
    redirect_to api_rfqs_path(step: 1), notice: 'Entry successfully deleted'
  end

  def delegation_summary
    if params[:q].present?
      if params[:q][:requirements_officer_first_name_or_requirements_officer_last_name_cont].present?
        params[:q][:requirements_officer_first_name_or_requirements_officer_last_name_cont] = "" if params[:q][:requirements_officer_first_name_or_requirements_officer_last_name_cont].downcase == "unassigned"
      end
      if params[:q][:monitoring_officer_first_name_or_monitoring_officer_last_name_cont].present?
        params[:q][:monitoring_officer_first_name_or_monitoring_officer_last_name_cont] = "" if params[:q][:monitoring_officer_first_name_or_monitoring_officer_last_name_cont].downcase == "unassigned"
      end

      # params[:q][:title_cont].strip! if params[:q][:title_cont].present?
      # params[:q][:principal_name_cont].strip! if params[:q][:title_cont].present?
      # params[:q][:requirements_officer_first_name_or_requirements_officer_last_name_cont].strip! if params[:q][:requirements_officer_first_name_or_requirements_officer_last_name_cont].present?
      # params[:q][:monitoring_officer_first_name_or_monitoring_officer_last_name_cont].strip! if params[:q][:monitoring_officer_first_name_or_monitoring_officer_last_name_cont].present?
      strip_values(params[:q])
    end
    @q = Rfq.ransack(params[:q])
    @rfqs = current_user.department.nil? ? @q.result.paginate(:page => params[:page], :per_page => 10) : @q.result.where(department: current_user.department).paginate(:page => params[:page], :per_page => 10)
  end

  def display_full_info
    @rfq = Rfq.find(params[:id])
    @rfq_items = RfqItem.where(rfq_id: @rfq.id)
  end

  def final_approval
    @rfq = Rfq.find params[:id]
    @rfq.update_attributes(:current_status => 't')
    redirect_to delegation_summary_api_rfqs_path(step: 2), notice: 'This RFQ has been approved.'
  end

  def rfq_item_delivery
    strip_values(params[:q]) if params[:q].present?
    @q = Rfq.ransack(params[:q])
    @rfqs = current_user.department.nil? ? @q.result.all.paginate(:page => params[:page], :per_page => 10) : @q.result.where(department: current_user.department).paginate(:page => params[:page], :per_page => 10)
  end

  def rfq_delivery_lists
    @rfq = Rfq.find params[:rfq_id]
    @delivery_list = RfqItem.where(rfq_id: @rfq.id)
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

  def rfq_disbursement_account
    strip_values(params[:q]) if params[:q].present?
    @q = Rfq.ransack(params[:q])
    @rfqs = current_user.department.nil? ? @q.result.all.paginate(:page => params[:page], :per_page => 10) : @q.result.where(department: current_user.department).paginate(:page => params[:page], :per_page => 10)
  end

  def rfq_anchorage_billings
    @rfq = Rfq.find params[:rfq_id]
    @delivery_reports = RfqItem.where(rfq_id: @rfq).order('id DESC')
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf         => "RFQ Anchorage Billing",
              :orientation  => 'Landscape',
              :page_width   => '13in',
              :margin => {:top       => 2,
                           :bottom   => 2}
      end
    end
  end

# >>>>>>> master
  private

  def set_rfq
    @rfq = Rfq.find(params[:id])
  end

  def set_rfq_eager_load
    @rfq = Rfq.includes(rfq_items: [:item], rfq_supplier_items:[:item, :supplier]).find(params[:id])
  end

  def rfq_params
    params.require(:rfq).permit(:title, :principal_id, :cage_code, :duns, :step, :sub_step, :department, :principal_name, :is_awarded, :requirements_officer_id, :monitoring_officer_id, :monitoring_officer_name, :requirements_officer_name)
  end

end
