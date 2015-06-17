class Api::SubCategoriesController < ApplicationController
  before_filter :set_sub_category, only: [:show, :update, :destroy, :edit]

  def index
    @sub_categories = current_user.department.nil? ? SubCategory.all : SubCategory.where(department: current_user.department)
    # render json: @categories
  end

  def create
    @sub_category = SubCategory.new(sub_category_params)
    @sub_category.department = current_user.department
    if @sub_category.save
      # render json: @sub_category, status: :created, sub_category: [:api, @sub_category]
      redirect_to api_sub_categories_path, notice: 'Entry created'
    else
      redirect_to @sub_category, alert: @sub_category.errors.full_messages.first
      # render json: { errors: @sub_category.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @sub_category.update(sub_category_params)
      # head :no_content
      redirect_to api_sub_categories_path, notice: 'Entry updated'
    else
      render json: { errors: @sub_category.errors }, status: :unprocessable_entity
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

  private

  def set_sub_category
    @sub_category = SubCategory.find(params[:id])
  end

  def sub_category_params
    params.require(:sub_category).permit(:name, :description, :category_id, :category_name, :sub_category_id, :department)
  end

end
