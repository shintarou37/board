class UsersController < ApplicationController
  def show
    @user_show = User.find(params[:id])
  end
end
