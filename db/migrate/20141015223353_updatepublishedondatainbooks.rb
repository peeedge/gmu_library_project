class Updatepublishedondatainbooks < ActiveRecord::Migration
  def change
  	self.up
  	rename_column :books, :publisehd_on, :published_on
  end
end
