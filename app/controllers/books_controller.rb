class BooksController < ApplicationController

	def index
		@available_at = Time.now
		@books = Book.order(:title)
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
			redirect_to @book, notice: "#{@book.title} was upadated!"
		else
			render :new
		end
	end

	def destroy
		@book.destroy
		redirect_to books_url
	end

	private

	def book_params
		params.require(:book).permit(:isbn, :title, :abstract, :pages, :genre, :published_on, :total_in_library, :author, :image_cover_url)
	end

	before_action :set_book, only: [ :show, :edit, :update, :destroy]

	def set_book
		@book = Book.find(params[:id])
	end

end