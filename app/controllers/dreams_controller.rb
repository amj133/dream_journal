class DreamsController < ApplicationController
  before_action :set_dream, only: [:show, :edit, :update, :destroy]

  def show
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
    if params[:anonymous?]
      @user = User.find_by(user_name: "Anonymous")
      @dream = @user.dreams.new(dream_params)
    else
      @user = User.find(params[:user_id])
      @dream = @user.dreams.new(dream_params)
    end
    @dream.save
    params[:dream][:category_ids].shift
    @dream.category_ids = params[:dream][:category_ids]

    redirect_to dream_path(@dream)
  end

  def edit
    if current_user == User.find(params[:user_id])
      @user = User.find(params[:user_id])
    elsif current_user
      redirect_to user_path(current_user)
    else
      flash.notice = "Need to be logged in"
      redirect_to '/'
    end
  end

  def update
    @dream.update(dream_params)
    @dream.category_ids = params[:dream][:category_ids]

    redirect_to dream_path(@dream)
  end

  def destroy
    user = User.find(params[:user_id])
    @dream.destroy

    redirect_to user_path(user)
  end

  private

  def set_dream
    @dream = Dream.find(params[:id])
  end

  def dream_params
    params.require(:dream).permit(:title, :body, :analysis)
  end

end
