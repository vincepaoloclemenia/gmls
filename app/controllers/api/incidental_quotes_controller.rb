class Api::IncidentalQuotesController < ApplicationController
  before_filter :set_incidental_quote, only: [:update, :destroy, :show, :display_data]

  def index
    # @incidental_quotes = current_user.department.nil? ? IncidentalQuote.all : IncidentalQuote.where(department: current_user.department)
    @incidental_quotes = IncidentalQuote.all
    render json: @incidental_quotes
  end

  def create
    @incidental_quote = IncidentalQuote.new(incidental_quote_params)
    @incidental_quote.department = current_user.department
    if @incidental_quote.save
      render json: @incidental_quote, status: :created, incidental_quote: [:api, @incidental_quote]
    else
      render json: { errors: @incidental_quote.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @incidental_quote.update(incidental_quote_params)
      head :no_content
    else
      render json: { errors: @incidental_quote.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @incidental_quote.destroy

    head :no_content
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
              :margin => {:top       => 2,
                           :bottom   => 4}
      end
    end
  end
  
  private

  def set_incidental_quote
    @incidental_quote = IncidentalQuote.find(params[:id])
  end

  def incidental_quote_params
    params.require(:incidental_quote).permit(:quotation_no, :company, :address, :subject, :subject_detail, :terms_and_condition, :validity, :prepared_by, :department)
  end
end
