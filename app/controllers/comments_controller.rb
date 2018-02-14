class CommentsController < ApplicationController

  def create
    @dream = Dream.find(params[:dream_id])
    if current_user
      @dream.comments.create!(comment_params)
    else
      flash.notice = "Need to be logged in"
    end
    redirect_to dream_path(@dream)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_name, :body)
  end

end
