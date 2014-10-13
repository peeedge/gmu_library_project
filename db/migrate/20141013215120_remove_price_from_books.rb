class RemovePriceFromBooks < ActiveRecord::Migration
  def change
  	self.up
  	remove_column :books, :price
  end
end
