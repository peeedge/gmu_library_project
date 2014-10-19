class Book < ActiveRecord::Base

	GENRES = 'Mystery', 'NonFiction', 'Fiction'
	TOTALINLIBRARY = 0,1,2,3,4,5
	#AUTHORS = 
	validates :isbn, :title, :abstract, :pages, :genre, :total_in_library, :author, presence: true
	validates :abstract, length: { minimum: 15 }, unless: 'abstract.blank?'
	validates :pages,
   		numericality: { only_integer: true, greater_than_or_equal_to: 0 },
   		unless: "pages.blank?"
 	validates :genre, inclusion: { in: GENRES, message: "must be from #{GENRES.first} to #{GENRES.last}" }
    has_many :reservations, dependent: :destroy

    # It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%") 
  end
end