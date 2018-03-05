class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
        @counter = Article.count + 1
        @categories =  Category.all
        if !params[:id].blank? 
            @article.category =  Category.find(params[:id])
        end
     end

     def edit
        @counter    =  Article.count 
        @categories =  Category.all
     end

     def destroy
        @article.destroy
           respond_to do |format|
           format.html { redirect_to ({:action=>"index"}), notice: 'Article was successfully destroyed.' }
           format.json { head :no_content }
        end
     end


     def update
        respond_to do |format|
            if @article.update(article_param)
               format.html { redirect_to ({:action=>"index"}), notice: 'Article was successfully updated.' }
               format.json { render :show, status: :ok, location:    @article}
            else
               format.html { render :edit }
               format.json { render json:  @article.errors, status: :unprocessable_entity }
            end
         end
     end

     def create 
        @article = Article.new(article_param)
        @article.user = current_user
        respond_to do |format|
         if @article.save
            format.html { redirect_to ({:action=>"index"}), notice: 'Article was successfully created.' }
            format.json { render :index, status: :created, location: @article }
         else
            format.html { render :new }
            format.json { render json: @article.errors, status: :unprocessable_entity }
         end
        end
     end


     private


     def article_param
        params.require(:article).permit(:name,:category_id,:visible,:content,:image)
     end

     def set_article
        @article = Article.find(params[:id])
     end

end
