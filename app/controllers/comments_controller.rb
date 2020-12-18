class CommentsController < ApplicationController
  def create

  end



  private

  def create_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id,collect_id: params[:collect_id])
  end
end
