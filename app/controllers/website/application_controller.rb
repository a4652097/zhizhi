class Website::ApplicationController < ActionController::Base
    layout 'layouts/website_layout'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  def set_categories
    @categories = Category.all
  end
end
