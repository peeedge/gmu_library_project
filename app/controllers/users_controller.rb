class UsersController < ApplicationController
	def index
		@available_at = Time.now
		@user = User.new
		@users = User.order(:username).page(params[:page])
	end

	def show
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to @user, notice: "#{@user.fullname} - #{@user.username} was updated!"
		else
			render :new
		end
	end

	def destroy
		@user.destroy
  		redirect_to users_url
	end

	def user_params
		params.require(:user).permit(:username, :fullname, :admin)
	end

	before_action :set_user, only: [ :show, :edit, :update, :destroy]

	def set_user
		@user = User.find(params[:id])
	end
end