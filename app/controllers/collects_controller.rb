class CollectsController < ApplicationController
  before_action :collect, only: [:edit, :update, :show, :destroy]
  before_action :search_product, only: [:new, :search]
  def index
  end

  def new
    @collect = Collect.new
    @collects = Collect.all.order('created_at DESC')
    set_collect_column
  end

  def search
    @results = @p.result
  end

  def create
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

  def search_product
    @p = Collect.ransack(params[:q]) 
    # binding.pry
  end

  def set_collect_column
    @collect_language = Collect.select("language_id").distinct
    # binding.pry
  end
end
