class AddUserNameToUser < ActiveRecord::Migration
  def change
  	add_column :users, :username, :string
  	add_index :users, :username, unique: true
  	change_column :users, :email, :string, null: true 
  end
end
