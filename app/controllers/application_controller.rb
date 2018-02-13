class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def add_category
    @dream = Dream.find(params[:dream_id])
    @categories = Category.all

    render :add_category
  end

  def create_add_category
    @dream = Dream.find(params[:dream_id])
    @new_category = Category.find(params[:dream][:new_category_id])
    @dream.categories.push(@new_category)

    redirect_to dream_path(@dream)
  end
end
