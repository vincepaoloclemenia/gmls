class Api::SubCategoriesController < ApplicationController
  before_filter :set_sub_category, only: [:show, :update, :destroy, :edit]

  def index
    # @sub_categories = current_user.department.nil? ? SubCategory.all : SubCategory.where(department: current_user.department)
    # render json: @categories
    clear_search_space
    @q = SubCategory.ransack(params[:q])
    @sub_categories = @q.result.includes(:category).paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @sub_category = SubCategory.new(sub_category_params)
    @sub_category.department = current_user.department
    if @sub_category.save
      # render json: @sub_category, status: :created, sub_category: [:api, @sub_category]
      redirect_to api_sub_categories_path, notice: 'Entry created'
    else
      redirect_to new_api_sub_category_path, alert: @sub_category.errors.full_messages.first
      # render json: { errors: @sub_category.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @sub_category.update(sub_category_params)
      # head :no_content
      redirect_to api_sub_categories_path, notice: 'Entry updated'
    else
      redirect_to edit_api_sub_category_path, alert: @sub_category.errors.full_messages.first
    end
  end

  def new
    @sub_category = SubCategory.new
  end
  
  def destroy
    @sub_category.destroy
    redirect_to api_sub_categories_path, notice: 'Entry successfully deleted'
    # head :no_content
  end

  def clear_search_space
    unless params["q"].nil?
      params["q"]["name_cont"].strip!
      params["q"]["category_name_cont"].strip!
    end
  end

  private

  def set_sub_category
    @sub_category = SubCategory.find(params[:id])
  end

  def sub_category_params
    params["sub_category"]["name"].strip!
    params.require(:sub_category).permit(:name, :description, :category_id, :category_name, :sub_category_id, :department)
  end

end
