class Website::WebsiteController < Website::ApplicationController
  before_action :set_categories
  def index
  end
  def new_comment
   @comment = Comment.new(comment_params)
   @comment.save
    redirect_to website_website_show_article_path
  end
  def show_article
    @article = Article.find(params[:website_id])
  end
  def show
    @category = Category.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:content,:article_id)
  end
end
