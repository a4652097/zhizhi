class CategorysController < ApplicationController
  before_action :get_id,only:[:edit,:destroy]
  def index
    @category = Category.all
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
    redirect_to root_path
    else
    flash.now[:notice] = "添加失败"

    redirect_to new_category_path
    end
  end

  def update
    if@category = Category.find_by_id(params[:id]).update(category_params)
    redirect_to articles_path
    else
    flash.now[:notice] = "修改失败"
    redirect_to edit_category_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def get_id
    @category=Category.find(params[:id])
  end
end
