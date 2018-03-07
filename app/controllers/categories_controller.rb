class CategoriesController < ApplicationController
    load_and_authorize_resource
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
        @counter = Category.count + 1
     end
    
     def edit
        @counter = Category.count
     end
 
     def create
        
        @Category = Category.new(category_params)
        
        respond_to do |format|
           if @Category.save
              format.html { redirect_to ({:action=>"index"}), notice: 'Category was successfully created.' }
              format.json { render :index, status: :created, location: @Category }
           else
              format.html { render :new }
              format.json { render json: @Category.errors, status: :unprocessable_entity }
           end
        end
     end

     def update
        respond_to do |format|
           if @category.update(category_params)
              format.html { redirect_to ({:action=>"index"}), notice: 'Recipe was successfully updated.' }
              format.json { render :show, status: :ok, location: @category }
           else
              format.html { render :edit }
              format.json { render json: @category.errors, status: :unprocessable_entity }
           end
        end
        
     end

     def destroy
        @category.destroy
           respond_to do |format|
           format.html { redirect_to ({:action=>"index"}), notice: 'Category was successfully destroyed.' }
           format.json { head :no_content }
        end
     end


private

def category_params
    params.require(:category).permit(:name, :visible,:lp)
end   

 def set_category
    @category = Category.find(params[:id])
 end


end
