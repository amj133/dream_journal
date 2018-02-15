class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)

    redirect_to categories_path
  end

  def edit
  end

  def update
    @category.update(category_params)

    redirect_to categories_path
  end

  def destroy
    @category.destroy

    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
