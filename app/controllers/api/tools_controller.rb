class Api::ToolsController < ApplicationController
  before_filter :set_tool, only: [:show, :update, :destroy, :edit]

  def index
    # @tools = Tool.all
    @q = Tool.ransack(params[:q])
    @tools = @q.result.paginate(:page => (params[:page]), :per_page => 10)
    # render json: @tools
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.department = current_user.department

    if @tool.save
      redirect_to api_tools_path, notice: 'Entry created'
    else
      # render json: { errors: @tool.errors }, status: :unprocessable_entity
      redirect_to @tool, alert: @tool.errors.full_messages.first
    end
  end

  def update
    if @tool.update(tool_params)
      redirect_to api_tools_path, notice: 'Entry updated'
    else
      render json: { errors: @tool.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @tool.destroy
    redirect_to api_tools_path, notice: 'Entry was successfully deleted'
  end

  def new
    @tool = Tool.new
  end

  private

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :quantity, :unit)
  end

end
