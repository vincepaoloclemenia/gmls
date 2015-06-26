class Api::IncidentalItemsController < ApplicationController
  before_filter :set_incidental_item, only: [:update, :destroy, :show, :edit]

  def index
    # @incidental_items = current_user.department.nil? ? IncidentalItem.all : IncidentalItem.where(department: current_user.department)
    @incidental_quote = IncidentalQuote.find(params[:incidental_quote_id])
    @incidental_items = IncidentalItem.where(incidental_quote_id: params[:incidental_quote_id])
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf         => "Incidental Quotation Form",
              :orientation  => 'Portrait',
              :page_width   => '13in',
              :margin => {:top       => 2,
                           :bottom   => 4}
      end
    end
  end

  def create
    @incidental_item = IncidentalItem.new(incidental_item_params)
    @incidental_item.department = current_user.department
    if @incidental_item.save
      redirect_to api_incidental_items_path(incidental_quote_id: @incidental_item.incidental_quote_id, step: 2), notice: 'Entry created'
      # render json: @incidental_item, status: :created, incidental_item: [:api, @incidental_item]
    else
      render json: { errors: @incidental_item.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @incidental_item.update(incidental_item_params)
      redirect_to api_incidental_items_path(incidental_quote_id: @incidental_item.incidental_quote_id, step: 2), notice: 'Entry updated'
    else
      # render json: { errors: @incidental_item.errors }, status: :unprocessable_entity
    end
  end
  
  def new
    @incidental_item = IncidentalItem.new 
  end

  def destroy
    @incidental_item.destroy
    redirect_to api_incidental_items_path(incidental_quote_id: params[:incidental_quote_id], step: 2), notice: 'Entry successfully deleted'
  end

  private

  def set_incidental_item
    @incidental_item = IncidentalItem.find(params[:id])
  end

  def incidental_item_params
    params.require(:incidental_item).permit(:incidental_quote_id, :item_id, :area, :price, :remarks, :department)
  end
end
