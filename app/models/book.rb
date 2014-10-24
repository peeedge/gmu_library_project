class Book < ActiveRecord::Base
  belongs_to :author
	GENRES = 'Mystery', 'NonFiction', 'Fiction'
	TOTALINLIBRARY = 0,1,2,3,4,5
	validates :isbn, :title, :abstract, :pages, :genre, :total_in_library, :author, presence: true
	validates :abstract, length: { minimum: 15 }, unless: 'abstract.blank?'
	validates :pages,
   		numericality: { only_integer: true, greater_than_or_equal_to: 0 },
   		unless: "pages.blank?"
 	validates :genre, inclusion: { in: GENRES, message: "must be from #{GENRES.first} to #{GENRES.last}" }
    has_many :reservations, dependent: :destroy

    # It returns the articles whose titles contain one or more words that form the query
  def self.search(search)
    #like_search_condition = "%" + search + "%"
    #find(:all, :conditions => ['title LIKE ? OR author LIKE ? OR isbn LIKE ?', like_search_condition, like_search_condition, search])
    search.present? and Book.joins(:author).where("books.title LIKE ? or books.isbn LIKE ? or authors.name LIKE ?", "%#{search.strip}%", "#{search.strip}", "%#{search.strip}%")
  end
end