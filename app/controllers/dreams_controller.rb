require 'pry'

class DreamsController < ApplicationController

  def show
    @dream = Dream.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @dream = @user.dreams.new
  end

  def create
    @user = User.find(params[:user_id])
    @dream = @user.dreams.new(dream_params)
    @dream.save

    redirect_to dream_path(@dream)
  end

  def edit
    @user = User.find(params[:user_id])
    @dream = Dream.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @dream = Dream.find(params[:id])
    @dream.update(dream_params)

    redirect_to dream_path(@dream)
  end

  private

  def dream_params
    params.require(:dream).permit(:title, :body, :analysis)
  end

end
