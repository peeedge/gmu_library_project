class UsersController < ApplicationController
	def index
		@available_at = Time.now
		@users = User.new
	end

	
end