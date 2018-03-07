class CommentsController < ApplicationController
    before_action :find_commentable
    before_action :authenticate_user!

    def index
      redirect_back fallback_location: root_path
    end

    def new
      @comment = Comment.new
      respond_to do |format|
        format.js { render action: "new" }
    end
    end

    def create
      @comment = @commentable.comments.new comment_params
      @comment.user = current_user
      if @comment.save
        redirect_back fallback_location: root_path  , notice: 'Your comment was successfully posted!'
      else
        redirect_back fallback_location: root_path , notice: "Your comment wasn't posted!"
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Article.find_by_id(params[:article_id]) if params[:article_id]
    end
end
