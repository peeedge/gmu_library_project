class AddIsbnToBooks < ActiveRecord::Migration
  def change
  	self.up
  	add_column :books, :isbn, :string
  	add_column :books, :genre, :string
  	add_column :books, :image_cover_url, :string
  	add_column :books, :publisehd_on, :date
  	add_column :books, :total_in_library, :integer
  	add_column :books, :abstract, :text
  end
end