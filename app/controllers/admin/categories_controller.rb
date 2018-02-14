class Admin::CategoriesController < ApplicationController
  before_action :require_admin

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)

    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)

    redirect_to categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
