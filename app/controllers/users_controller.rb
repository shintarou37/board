class UsersController < ApplicationController
  before_action :user_show, only: [:edit, :show]
  before_action :move_to_index, only: [:edit, :update, :destory]
  def show
  end

  def edit 
  end

  def update
  end

  private 

  def user_show
    @user_show = User.find(params[:id])
  end
  def move_to_index
    unless user_signed_in? || current_user.id == @user_show.id
    redirect_to root_path
    end
  end
end
