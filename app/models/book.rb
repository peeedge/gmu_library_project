class Book < ActiveRecord::Base
	validates :isbn, :title, :genre, :image_cover_url, presence: true
	validates :abstract, length: {minimum: 15}, unless: 'abstract.blank?'
	validates :total_in_library, :pages
	   numericality: { only_integer: true, greater_than_or_equal_to: 0 },
	   unless: "total_in_library.blank?"
	has_many :authors, dependent: :destroy 
end