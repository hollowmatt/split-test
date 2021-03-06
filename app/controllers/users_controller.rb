class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			finished("signup_title", reset: false)
			finished("navigation", reset: false)
			redirect_to root_url, notice: "Thank you for signing up"
		else
			render "new"
		end
	end

	private
		def user_params
			params.required(:user).permit(:email, :password)
		end
end
