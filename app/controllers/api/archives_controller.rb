class Api::ArchivesController < ApplicationController
  # before_filter :set_category, only: [:show, :update, :destroy]

  def index
    @users = User.only_deleted
    render json: @users
  end

  
end
