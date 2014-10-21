class AuthorsController < ApplicationController

	def index
		@available_at = Time.now
		@authors = Author.order(:name)
	end

	def new
		@author = Author.new
	end
	
	def show
		@author = Author.find(params[:id])
	end


	def create
		@author = Author.new(author_params)
		if @author.save
			redirect_to @author, notice: "#{@author.name} was created!"
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @author.update(author_params)
			redirect_to @author, notice: "#{@author.name} was upadated!"
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