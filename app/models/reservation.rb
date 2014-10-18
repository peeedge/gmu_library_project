class Reservation < ActiveRecord::Base
	belongs_to :user #=> "User", :foreign_key => 'user_id'
	belongs_to :book #=> "Book", :foreign_key => 'book_id'
end