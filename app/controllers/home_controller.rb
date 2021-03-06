class HomeController < ApplicationController

  def index
      @articles = Article.all
      @categories = Category.first(5)
    if !params[:category_id].blank? 
      @articles = Article.where("category_id in (?)", params[:category_id])
    end
    @articles  = @articles.paginate(:page => params[:page], :per_page => 5) 
  end
end
