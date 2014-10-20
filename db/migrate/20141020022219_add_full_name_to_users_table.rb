class AddFullNameToUsersTable < ActiveRecord::Migration
  def change
  	self.up
  	add_column :users, :fullname, :string
  end
end
