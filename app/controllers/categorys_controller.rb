class CategorysController < ApplicationController
  before_action :set_category,only:[:edit,:destroy]
  before_action :authenticate_model!
  def index
    @categorys = Category.all
  end

  def destroy
    @category.destroy
    redirect_to articles_path
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if@category.save
    redirect_to articles_path
    else
    redirect_to new_category_path
    end
  end

  def update
    if@category = Category.find_by_id(params[:id]).update(category_params)
    redirect_to articles_path
    else
    redirect_to edit_category_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end
