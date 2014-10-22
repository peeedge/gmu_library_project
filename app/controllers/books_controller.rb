class BooksController < ApplicationController

	def index
		@available_at = Time.now
		if params[:search]
	      @books = Book.search(params[:search]).order("created_at DESC")
	    else
		 @books = Book.order(:title).page(params[:page])
	     #@books = Book.order("created_at DESC")
	    end
	end

	def new
		@book = Book.new
	end
	
	def show
	end


	def create
		@book = Book.new(book_params)
		if @book.save
			redirect_to @book, notice: "#{@book.title} was created!"
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @book.update(book_params)
			redirect_to @book, notice: "#{@book.title} was updated!"
		else
			render :new
		end
	end

	def destroy
		@book.destroy
		redirect_to books_url
	end

	def search
		@books = Book.search params[:search]
		#redirect_to search_url
	end

	def search_results
		@books = Book.search params[:search]
	end

	private

	def book_params
		params.require(:book).permit(:isbn, :title, :abstract, :pages, :genre, :published_on, :total_in_library, :author_id, :image_cover_url)
	end

	before_action :set_book, only: [ :show, :edit, :update, :destroy]

	def set_book
		@book = Book.find(params[:id])
	end
end