class AuthorsController < ApplicationController

	def index
		@available_at = Time.now
		@authors = author.order(:title)
	end

	def new
		@author = author.new
	end
	
	def show
	end


	def create
		@author = author.new(author_params)
		if @author.save
			redirect_to @author, notice: "#{@author.title} was created!"
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @author.update(author_params)
			redirect_to @author, notice: "#{@author.title} was upadated!"
		else
			render :new
		end
	end

	def destroy
		@author.destroy
		redirect_to authors_url
	end

	private

	def author_params
		params.require(:author).permit(:name)
	end

	before_action :set_author, only: [ :show, :edit, :update, :destroy]

	def set_author
		@author = Author.find(params[:id])
	end

end