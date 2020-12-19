class UsersController < ApplicationController
  def show
    @user_show = User.find(params[:id])
  end

  def edit 
    @user_show = User.find(params[:id])
  end

  def update
  end
end
