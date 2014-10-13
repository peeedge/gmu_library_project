class RemoveUrlCoverFromBooks < ActiveRecord::Migration
  def change
  	self.up
  	remove_column :books, :urlCover
  end
end
