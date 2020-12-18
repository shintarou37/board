class CommentsController < ApplicationController
  def create
    @comment = Comment.new(create_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', comment: @comment , user: @comment.user.nickname
    end
  end

  private

  def create_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id,collect_id: params[:collect_id])
  end
end
