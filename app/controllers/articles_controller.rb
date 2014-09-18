class ArticlesController < ApplicationController
  before_action :get_id,only:[:edit,:destroy]
  def index
    @article = Article.all
  end
  def new
    @article = Article.new
    @categories = Category.all
  end
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      redirect_to new_article_path
  end
end
  def destroy
    @article.destroy
    redirect_to root_path
  end

  def edit

  end

  def update
    if@article = Article.find_by_id(params[:id]).update(article_params)
      redirect_to root_path
    else
      redirect_to edit_article
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :category_id)
  end

  def get_id
      @article=Article.find(params[:id])
  end
end
