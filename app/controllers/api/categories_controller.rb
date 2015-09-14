class Api::CategoriesController < ApplicationController
  before_filter :set_category, only: [:show, :update, :destroy, :edit]

  def index
    # @categories = current_user.department.nil? ? Category.all : Category.where(department: current_user.department)
    clear_search_space
    @q = Category.ransack(params[:q])
    @categories = @q.result.paginate(:page => params[:page], :per_page => 10)
    # render json: @categories
  end

  def create
    
    @category = Category.new(category_params)
    @category.department = current_user.department
    if @category.save
      # render json: @category, status: :created, category: [:api, @category]
      redirect_to api_categories_path, notice: 'Entry created'
    else
      redirect_to new_api_category_path, alert: @category.errors.full_messages.first
    end
  end

  def update
    if @category.update(category_params)
      # head :no_content
      redirect_to api_categories_path, notice: 'Entry updated'
    else
      redirect_to edit_api_category_path, alert: @category.errors.full_messages.first
    end
  end
  
  def new
    @category = Category.new
  end

  def destroy
    @category.destroy
    redirect_to api_categories_path, notice: 'Entry successfully deleted.'
    # head :no_content
  end

  def clear_search_space
    unless params["q"].nil?
      params["q"]["name_cont"].strip!
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params["category"]["name"].strip!
    params.require(:category).permit(:name, :description, :department)
  end

end
