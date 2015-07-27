class Api::IncidentalQuotesController < ApplicationController
  before_filter :set_incidental_quote, only: [:update, :destroy, :show, :display_data, :edit]

  def index
    # @incidental_quotes = current_user.department.nil? ? IncidentalQuote.all : IncidentalQuote.where(department: current_user.department)
    @logreqs = Logreq.all
    # @logreq_responses = LogreqResponse.where(logreq_id: @logreq.id)
    # @incidental_quotes = IncidentalQuote.where(logreq_id: @logreq.id)
    # render json: @incidental_quotes
  end

  def manage_services
    @incidental_quotes = IncidentalQuote.where(logreq_id: params[:li])
    respond_to do |format|
      format.html
    end
  end

  def new
    @incidental_quote = IncidentalQuote.new
  end

  def create
    @incidental_quote = IncidentalQuote.new(incidental_quote_params)
    @incidental_quote.department = current_user.department
    if @incidental_quote.save
      redirect_to manage_services_api_incidental_quotes_path(li: @incidental_quote.logreq_id, step: 2), notice: 'Entry created'
      # render json: @incidental_quote, status: :created, incidental_quote: [:api, @incidental_quote]
    else
      render json: { errors: @incidental_quote.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @incidental_quote.update(incidental_quote_params)
      redirect_to manage_services_api_incidental_quotes_path(li: @incidental_quote.logreq_id, step: 2), notice: 'Entry updated'
    else
      render json: { errors: @incidental_quote.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @incidental_quote.destroy
    redirect_to manage_services_api_incidental_quotes_path(li: params[:li], step: 2), notice: 'Entry successfully deleted'
  end

  def show
    render json: @incidental_quote
  end

  def display_data
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
  
  private

  def set_incidental_quote
    @incidental_quote = IncidentalQuote.find(params[:id])
  end

  def incidental_quote_params
    params.require(:incidental_quote).permit(:quotation_no, :company, :address, :subject, :subject_detail, :terms_and_condition, :validity, :prepared_by, :department, :logreq_id)
  end
end
