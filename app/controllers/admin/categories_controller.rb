class Admin::CategoriesController < ApplicationController
  before_action :require_admin

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    render "/public/404" unless current_admin?
  end
end
