class CollectsController < ApplicationController
  def index
  end

  def new
    @collect = Collect.new
    @collects = Collect.all
  end

  def create
    collect = Collect.create(create_params)
    render json:{ collect: collect }
  end

  private
  def create_params
    params.require(:collect).permit(:explanation,:language_id).merge(user_id: current_user.id)
  end
end
