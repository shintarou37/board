class UsersController < ApplicationController
  def show
    @user_show = User.find(params[:id])
    @user_detail = UserDetail.find(@user_show.id)
  end
end
