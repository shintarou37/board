class CollectsController < ApplicationController
  def index
  end

  def new
    @collect = Collect.new
    @collects = Collect.all.order('created_at DESC')
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
    @collect = Collect.find(params[:id])
  end

  private
  def create_params
    params.require(:collect).permit(:explanation,:language_id,:goal_id,:type_id,:framework_id).merge(user_id: current_user.id)
  end
end
