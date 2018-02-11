class CommentsController < ApplicationController

  def create
    @dream = Dream.find(params[:dream_id])
    @dream.comments.create!(comment_params)

    redirect_to dream_path(@dream)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_name, :body)
  end

end
