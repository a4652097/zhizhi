class CommentsController < ApplicationController
  def index
  end
  def new_comment
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to website_website_show_article_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
