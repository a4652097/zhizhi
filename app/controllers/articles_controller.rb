class ArticlesController < ApplicationController
  before_action :set_article,only:[:edit, :destroy]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      redirect_to new_article_path
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def edit
    @categories = Category.all
  end

  def update
    if@article = Article.find_by_id(params[:id]).update(article_params)
      redirect_to articles_path
    else
      redirect_to edit_article
    end
  end

  def show_comment
    @articles = Article.find(params[:article_id])
  end

  def destroy_comment
     @articles = Article.find_by_id(params[:article_id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :category_id)
  end

  def set_article
      @article = Article.find(params[:id])
  end

end
