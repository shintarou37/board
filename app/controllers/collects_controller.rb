class CollectsController < ApplicationController
  before_action :collect, only: [:edit, :update, :show, :destroy]
  def index
    # binding.pry
  end

  def new
    @collect = Collect.new
    @collects = Collect.all.order('created_at DESC')
  end

  def create
    binding.pry
    collect = Collect.create(create_params)
    collect_id = collect.id
    language = collect.language.name
    type = collect.type.name
    goal = collect.goal.name
    framework = collect.framework.name
    render json:{ collect: collect, language: language, collect_id: collect_id, type: type, framework: framework}
  end

  def show
    collect = Collect.find(params[:id])
    @comment = Comment.new
    if collect.comments.present?
      @comments = collect.comments
    end
  end

  def edit
  end

  def update
    if @collect.update(create_params)
      redirect_to action: :new
    else
      render :edit
    end
  end

  def destroy
    @collect.destroy
    redirect_to action: :new
  end

  private
  def create_params
    params.require(:collect).permit(:explanation,:language_id,:goal_id,:type_id,:framework_id).merge(user_id: current_user.id)
  end

  def collect
    @collect = Collect.find(params[:id])
  end
end
