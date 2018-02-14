class Admin::CommentsController < ApplicationController

  def destroy
    @comment = Comment.find(params[:id])
    dream = Dream.find(@comment.dream_id)
    user = User.find(dream.user_id)
    @comment.destroy

    redirect_to dream_path(dream)
  end
end
