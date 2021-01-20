class AuthorsController < ApplicationController
	def index
		@authors = Author.all
	end

	def show
		@author = Author.find(params[:id])
	end

	def new
		@author = Author.new
		@categories = Category.all
	end

	def create
        @author = Author.new(author_params)
        if @author.save
            redirect_to author_path(@author)
        else
            render :new
        end
	end

	def edit
		@author = Author.find(params[:id])
		@categories = Category.all
	end

	def update
	  @author = Author.find(params[:id])
	  @author.update(_params)
	  redirect_to post_path(@post)
	end

  private

  def author_params
    params.require(:author).permit(:name, :genre, :bio)
  end
end
