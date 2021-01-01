class CommentsController < ApplicationController
  def create
    @comment = Comment.new(create_params)
    ActionCable.server.broadcast 'comment_channel', comment: @comment, user: @comment.user.nickname if @comment.save
  end

  private

  def create_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, collect_id: params[:collect_id])
  end
end
