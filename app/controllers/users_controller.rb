class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
end
