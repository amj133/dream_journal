require 'pry'

class UsersController < ApplicationController


  def index
    @users = User.all
  end

  def show
    if current_user
      @user = User.find(params[:id])
    else
      flash.notice = "Need to be loggin in"
      redirect_to users_path
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password, :email)
  end

end
