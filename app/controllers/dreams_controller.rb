require 'pry'

class DreamsController < ApplicationController

  def show
    @dream = Dream.find(params[:id])
    @comment = @dream.comments.new
  end

  def new
    if current_user
      @dream = current_user.dreams.new
    else
      flash.notice = "Need to be logged in"
      redirect_to '/'
    end
  end

  def create
    @user = User.find(params[:user_id])
    @dream = @user.dreams.new(dream_params)
    @dream.save
    params[:dream][:category_ids].shift
    @dream.category_ids = params[:dream][:category_ids]

    redirect_to dream_path(@dream)
  end

  def edit
    if current_user
      @user = User.find(params[:user_id])
      @dream = Dream.find(params[:id])
    else
      redirect_to '/'
    end
  end

  def update
    @dream = Dream.find(params[:id])
    @dream.update(dream_params)

    redirect_to dream_path(@dream)
  end

  def destroy
    @user = User.find(params[:user_id])
    @dream = Dream.find(params[:id])
    @dream.destroy

    redirect_to user_path(@user)
  end

  private

  def dream_params
    params.require(:dream).permit(:title, :body, :analysis)
  end

end
