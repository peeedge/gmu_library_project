class Book < ActiveRecord::Base
	@available_at = Time.now
	@books = Book.all
end
